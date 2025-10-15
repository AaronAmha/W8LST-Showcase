# 🎱 W8LST — The Real-Time Pool Table Queue App

**W8LST** is a cross-platform Flutter app that transforms how players line up for pool tables at bars, lounges, and pool halls.  
Partnered businesses host live queues, and players can join, match up, and track their stats — all in real time.

---

## 🚀 Overview

No more writing names on chalkboards or waiting awkwardly for your turn.  
W8LST digitizes the experience with:

- **Live Queues per Table:** Join or leave instantly from your phone.  
- **Automatic Matchmaking:** The first two players in line start a match when both accept the countdown.  
- **Match Confirmation Flow:** Both players confirm the same winner before results are recorded.  
- **ELO-style Ranking:** Wins and losses update your rank and streak automatically.  
- **Business Integration:** Bars and pool halls display active tables and manage queues.  
- **Map Discovery:** See nearby venues with available tables and queue sizes.  
- **Player Profiles:** View stats, history, and friends’ activity.  
- **Social System:** Add friends, send invites, and celebrate wins in your feed.  

---

## 📱 App Screens

| Home / Map | Queue View | Match Popup | Profile |
|-------------|-------------|--------------|-----------|
| <img width="150" height="300" alt="IMG_1132" src="https://github.com/user-attachments/assets/96cac3eb-b4f7-46e6-be64-62c5d6743e0d" /> |<img width="150" height="300" alt="IMG_1133" src="https://github.com/user-attachments/assets/6345e1a1-fd0c-4570-bb83-ea20002d68f2" /> |<img width="150" height="300" alt="IMG_1134" src="https://github.com/user-attachments/assets/0e579642-b49f-491f-a0b0-76aa4170b724" />|<img width="150" height="300" alt="IMG_1135" src="https://github.com/user-attachments/assets/5091f965-d078-4f05-b24e-7d653574f772" /> |



## 🧩 Core Features

### 🌀 Real-Time Queue System
- Built on **Firebase Realtime Database**
- Data Path: `/queues/{businessID}/{tableID}`
- Dynamic countdown for match acceptance (15 seconds)
- Automatic match start and end logic

### 👤 User Profiles
- Stored under `/users/{userID}`
- Fields: username, avatarUrl, bio, wins, losses, rank, friends
- Integrated win/loss tracking and ranking system

### 🗺️ Map & Businesses
- Businesses stored in **Firestore** under `/businesses/{businessID}`
- Each includes name, address, GeoPoint, rating, and active tables
- Users discover and join active tables nearby

### 🧑‍🤝‍🧑 Friends & Social Feed
- Friends stored under `/friends/{userID}/friendList`
- Optional push notifications via FCM for wins, invites, and friend requests
- Future activity feed: “Aaron just won a match at The Spot”

---

## ⚙️ Tech Stack

| Layer | Technology |
|-------|-------------|
| Frontend | Flutter 3.22+ |
| Backend | Firebase (Realtime DB, Firestore, Auth, Storage, FCM) |
| State Mgmt | Provider |
| Payments | Stripe (In-App Purchases, Apple Pay, Google Pay) |
| Notifications | Firebase Cloud Messaging + Local Notifications |
| Maps | Google Maps SDK for Flutter |
| Hosting / Analytics | Firebase Hosting + Analytics |

---

## 🏗️ Architecture

