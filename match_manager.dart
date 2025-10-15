Future<void> submitWinnerSelection(String userId, String selectedWinnerId) async {
  if (_currentMatch == null || _currentMatch!.state != MatchState.selectingWinner) return;

  final matchId = _currentMatch!.matchId;

  // 🔄 Submit vote
  await _database.child(_matchPath).child('winnerSelections').update({
    userId: selectedWinnerId,
  });

  // 🔍 Reload updated match
  final snapshot = await _database.child(_matchPath).get();
  final updatedMatch = MatchData.fromMap(Map<String, dynamic>.from(snapshot.value as Map));
  final selections = updatedMatch.winnerSelections ?? {};

  // ✅ If both voted and agree
  if (selections.length == 2 && selections.values.toSet().length == 1) {
    final winnerId = selections.values.first;
    final loserId = winnerId == updatedMatch.player1Id
        ? updatedMatch.player2Id
        : updatedMatch.player1Id;

    // ✅ Update match to finished
    await _database.child(_matchPath).update({
      'state': MatchState.finished.toString().split('.').last,
      'winnerId': winnerId,
    });

    // 📊 UPDATE STATISTICS HERE
    try {
      final gameStartTime = updatedMatch.gameStartedAt ?? updatedMatch.createdAt;
      final gameDuration = DateTime.now().difference(gameStartTime).inMinutes;
      
      final gameType = updatedMatch.gameRules?['gameType'] ?? '8 Ball';
      final gameRule = updatedMatch.gameRules?['gameRule'] ?? 'Kitchen';
      
      final statManager = StatManager();
      await statManager.updateStatsAfterMatch(
        winnerId: winnerId,
        loserId: loserId,
        gameType: gameType,
        gameRule: gameRule,
        durationMinutes: gameDuration.clamp(1, 180),
      );
    } catch (e) {
      print('❌ Error updating statistics: $e');
    }

    // 🧹 Clear match and trigger new one
    await _database.child(_matchPath).remove();
    _currentMatch = null;

    if (_queueManager != null) {
      await _queueManager!.handleMatchCompletion(winnerId, loserId);
      await _queueManager!.fetchQueue();

      if (_queueManager!.queueUsers.length >= 2) {
        await QueueMatchIntegration.checkAndCreateMatch(_queueManager!, this);
      }
    }
  }
}
🎮 Full match lifecycle - invitation → rules → playing → winner → cleanup
🏆 Consensus mechanism - both players must agree on winner
📊 Automatic ELO updates - integrated with stats system
♻️ Auto-creates next match - seamless queue progression
⏱️ Server-side countdown - can't be manipulated by client
