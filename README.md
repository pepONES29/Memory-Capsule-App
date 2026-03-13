# Memory-Capsule-App

A mental health companion designed to preserve and relive happiness. Seal photos and thoughts in digital capsules that unlock at a future date of your choice.

Memory Capsule is a mobile application designed as a mental health companion for everyday use. It provides users with a digital space to store cherished memories in "capsules" that remain sealed until a date of their choosing, allowing them to relive happiness at a future time.



🧞‍♂️ Features

Core Functionality

- Photo Capsules: Capture a new moment using the camera or select an existing image from your gallery.

- Text Capsules: Write personal, journal-style entries to be locked away for later reflection.

- Metadata Tagging: Assign a title and specific location to every memory created.

- Custom Seal Duration: Set a specific date and time for when the capsule will be ready to open.


Outlined Features (UI Screens Present)

- Daily Suggestions: Planned features for random adventures and good deeds to boost daily well-being.

- User Preferences Pyramid: A planned visualization for personal growth and preferences.



🛠 Technical Specifications

- Flutter Version: 3.27.1

- Dart Version: 3.6.0

- Android SDK Version: 35.0.0

- Dev Tools Version: 2.40.2

- Asset Management: All project files and images are contained within the internal app directory.



📲 Installation Guide

For General Users (APK Installation)

- Enable Unknown Sources: Go to your Android device's Security Settings and enable the option to allow installations from unknown sources.

- Transfer APK: Transfer the provided APK file to your device via USB cable or download it directly.

- Install: Locate the file using a file manager on your device, tap it, and follow the on-screen instructions.

- Launch: Once installed, the app will be available in your app drawer.


For Developers (Source Code Exploration)

- Extract Project: Extract the project ZIP file to your local machine.

- Verify Environment: Run flutter doctor in your terminal to ensure Flutter is correctly configured.

- Open Project: Open the project folder in Android Studio or Visual Studio Code.

- Get Dependencies: Run the following command in the terminal: flutter pub get

- Run the App: Connect an Android device or start an emulator, then execute: flutter run



🔒 Important Usage Notes & Prototype Limitations

- Mock Authentication: While Login and Account Creation screens are available, they are not currently tied to specific user profiles. You may enter any text into these forms to proceed.

- Data Persistence: A database is present; however, user preference saving and account-bound information are not yet implemented.

- LLM Integration: Because a Large Language Model (LLM) has not been integrated yet, the Daily Good Deed, Adventure, and Preferences Pyramid features are currently non-functional outlines.

- Demonstration Capsule: To view the "unlock" experience immediately, one pre-ready capsule is available in the Capsule Gallery for demonstration purposes.
