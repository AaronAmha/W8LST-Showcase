Future<void> _handleQueueUpdate(DatabaseEvent event) async {
  final oldLength = _queueUsers.length;
  final oldUsers = List<QueueUser>.from(_queueUsers);
  _parseQueueData(event.snapshot);
  _updateCurrentUserQueueStatus();
  await _checkForMatchCreation(oldLength);
  await _checkForNewPlayerTriggers(oldLength, oldUsers);
  notifyListeners();
}
