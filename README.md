# Chat App

A Flutter chat app built on Firebase. Users sign up and log in with email and password, set up a profile, and send messages that appear live for everyone in the chat.

## Features
- Email and password sign-up and login (Firebase Authentication)
- Profile setup with name, bio, age, gender and a profile image picked from the device
- Messages stored in Cloud Firestore and streamed to the chat screen, newest at the bottom, auto-scrolling on new messages
- Error messages shown in snack bars

## Tech stack
Flutter, Dart, flutter_bloc (Cubit), Firebase Auth, Cloud Firestore, image_picker

## Project structure
- `lib/cubit`: auth, message and user data cubits
- `lib/pages`: sign up, login, profile and chat pages
- `lib/models`, `lib/widgets`, `lib/helper`

## Run it
1. Install Flutter and run `flutter pub get`.
2. Connect your own Firebase project (`flutterfire configure`) with Authentication (email/password) and Cloud Firestore enabled.
3. `flutter run`
