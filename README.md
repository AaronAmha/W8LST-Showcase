# 🎱 W8LST — The Real-Time Pool Table Queue App

[![Download on TestFlight](https://img.shields.io/badge/iOS-TestFlight-blue?logo=apple)](https://testflight.apple.com/join/XwscEuc6)
[![Get it on Google Play](https://img.shields.io/badge/Android-Google%20Play-green?logo=google-play)](https://play.google.com/store/apps/details?id=com.w8lst.app)

**W8LST** is a cross-platform Flutter app that transforms how players line up for pool tables at bars, lounges, and pool halls.  
Partnered businesses host live queues, and players can join, match up, and track their stats — all in real time.

> **Status:** Live on iOS (TestFlight) and Android (Google Play) | 100+ Active Users | 5+ Partnered Venues in Boulder, CO
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

## 🚀 Getting Started (For Developers)

While the full source code is proprietary, here's how the app is structured:

### Project Structure
```
W8LST/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── home.dart                          # Main home screen
│   │
│   ├── auth/                              # Authentication
│   │   ├── auth_export.dart
│   │   ├── auth_support.dart
│   │   ├── auth_view_model.dart
│   │   ├── login_view.dart
│   │   ├── forgot_password_view.dart
│   │   └── homescreen_view.dart
│   │
│   ├── business/                          # Business/Venue Management
│   │   ├── business_admin_view.dart
│   │   ├── business_admin_wrapper.dart
│   │   ├── business_view_model.dart
│   │   ├── business_admin/                # Admin-specific features
│   │   │   ├── business_stats.dart
│   │   │   └── business_details_view.dart
│   │   └── business_specialty_qr_creator.dart
│   │
│   ├── queue/                             # Real-Time Queue System
│   │   ├── queue_page.dart
│   │   ├── queue_control_view.dart
│   │   ├── queue_debug_tool.dart
│   │   ├── queue_header_view.dart
│   │   ├── queue_manager.dart
│   │   └── queue_user.dart
│   │
│   ├── match/                             # Match Management & Logic
│   │   ├── match_export.dart
│   │   ├── match_accept.dart
│   │   ├── match_manager_service.dart
│   │   ├── match_manager_popup.dart
│   │   ├── match_manager_service_new.dart
│   │   └── match_manager_popup_new.dart
│   │
│   ├── profile/                           # User Profiles & Stats
│   │   ├── profile_export.dart
│   │   ├── profile_view_model.dart
│   │   ├── circular_profile_image.dart
│   │   ├── image_picker_widget.dart
│   │   ├── settings_row_view.dart
│   │   └── manage_subscription_page.dart
│   │
│   ├── friend/                            # Social/Friends System
│   │   ├── friend_manager.dart
│   │   ├── friend_messages_manager.dart
│   │   ├── friend_messages_view.dart
│   │   └── friend_notification_indicator.dart
│   │
│   ├── notifications/                     # Push Notifications (FCM)
│   │   ├── navigation_service.dart
│   │   ├── direct_notification_services.dart
│   │   ├── notification_manager_view.dart
│   │   └── notification_support.dart
│   │
│   ├── chat/                              # In-App Messaging
│   │   ├── chat_dart.dart
│   │   ├── admin_profile_indicator.dart
│   │   └── match_accept.dart
│   │
│   ├── shop/                              # Shop & Payments
│   │   ├── shop_analytics.dart
│   │   ├── shop_screens.dart
│   │   ├── shop_admins_panel.dart
│   │   ├── subscription_bar.dart
│   │   └── payment_service.dart
│   │
│   ├── nav/                               # Navigation
│   │   ├── directions_model.dart
│   │   ├── directions_repository.dart
│   │   ├── location_details_view.dart
│   │   ├── user_location_model.dart
│   │   └── check_notification_services.dart
│   │
│   ├── social/                            # Social Feed
│   │   ├── social_home.dart
│   │   ├── social_models.dart
│   │   ├── user_profile_page.dart
│   │   └── date_profile_page.dart
│   │
│   ├── statistics/                        # Stats & Leaderboards
│   │   ├── stat_manager.dart
│   │   ├── statistics_home.dart
│   │   ├── stats_support.dart
│   │   ├── leader_board.dart
│   │   └── language_page.dart
│   │
│   ├── settings/                          # App Settings
│   │   ├── settings_page.dart
│   │   ├── settings.dart
│   │   └── settings_row_view.dart
│   │
│   └── widgets/                           # Reusable UI Components
│       ├── bar_scaffold_bar.dart
│       ├── link_social_media_page.dart
│       └── tutorial_box.dart
│
├── ios/                                   # iOS Native Code
├── android/                               # Android Native Code
└── linux/                                 # Linux Support
```
**Developer:**
- 👤 **Aaron Amha**
- 📧 [aaronamha0418@gmail.com](mailto:aaronamha0418@gmail.com)
- 💼 [LinkedIn](https://www.linkedin.com/in/aaron-amha/)
- 🐙 [GitHub](https://github.com/AaronAmha)

---

## 📝 About This Repository

This is a **showcase repository** demonstrating the technical architecture, features, and capabilities of W8LST. The full source code is proprietary and not publicly available.

**For hiring managers and recruiters:**  
Full source code, additional technical documentation, and code deep-dives are available upon request for serious employment inquiries.

---

## 📄 License

Showcase materials © 2024-2025 Aaron Amha. All rights reserved.  
W8LST™ is a trademark of Aaron Amha.

---

<div align="center">

**Built with ❤️ in Boulder, Colorado**

*Transforming the pool hall experience, one queue at a time* 🎱

</div>
