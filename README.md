<p align="center"><a href="https://flutter.dev/" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" width="400"></a></p>

Skill Optimizer - Mobile / Employees

<p align="left"><a target="_blank"><img src="https://firebasestorage.googleapis.com/v0/b/skill-optimizer.appspot.com/o/images%2Fsos_logo.png?alt=media&token=aaaaf437-54b2-4e8a-a5d4-bd2d3d3b83cf" width="120"></a></p>


## Getting Started

There’s two ways to run the Flutter mobile app:
1. Download and install the APK file using the link that follows.
Important note: using the below APK, Laravel should be running using the IP: 192.168.100.6:8000
To run Laravel with this IP, use: php artisan serve --host 192.168.100.6

2. Follow the instructions to completely download, install and setup Flutter
  . Official instructions to install Flutter:
    https://flutter.dev/docs/get-started/install
  . Vs-code setup:
    https://flutter.dev/docs/development/tools/vs-code
  . Android Studio and IntelliJ:
    https://flutter.dev/docs/development/tools/android-studio

  . Make sure you Get Packages of the file pubspec.yaml
    In file app_router.dart / line 30 / change the IP accordingly to your Laravel host IP

3. Connect Firebase to Flutter project to use Authentication + Firestore + Cloud Storage:
  . Official instructions to Add Firebase to a Flutter project:
    https://firebase.google.com/docs/flutter/setup
 Note: Google services path location:
 android/app/google-services.json

4. Run the Flutter app
Important note: A user should be created in the admin Panel / Website project, and this user should be used to login to the flutter App.