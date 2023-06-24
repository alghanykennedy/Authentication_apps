# Authentication Flutter Apps

Authentication Flutter App is a simple auth method application built with Flutter 3.0 and powered by the GetX pattern for state management. This app allows you to create account, login and view a list of User with smooth animations.

## Features

### 1. Welcome Screen

This feature allows you to choose signup or login before you go forward to home screen.

### 2. Signup Screen

Don't have account? Don't worry just create new one, it's free!

### 3. Login Screen

If you already have account or you success to signup, try to login glad to see you back.

### 4. Home Screen

This feature allows you to scroll through a list of User. Each User is displayed in a listview smoothly into view.

## Project Structure
```
|-- lib
    |-- core
        |-- constants
            |-- usecases
        |-- http_client
        |-- util
    |-- data
        |-- providers
            |-- api_client.dart
    |-- modules
        |-- authentication
            |-- application
                |-- bindings
                |-- controllers
            |-- domain
                |-- entities
                |-- params
                |-- usecase
                |-- auth_repository.dart
            |-- infrastructure
                |-- api
                |-- local_storage
                |-- auth_repository_impl.dart
            |-- presentation
                |-- authentication
                    |-- widgets
                |-- login_screnn.dart
                |-- signup_sceen.dart
        |-- users
        |-- welcome
    |-- main.dart
```

## How to Run the App

- Clone the repository
- Ensure you have Flutter installed and set up
- Run `flutter pub get` to fetch the project dependencies
- Use `flutter run` to start the application

## Technologies and Packages Used

- Flutter 3.0
- [GetX](https://github.com/jonataslaw/getx) for state management 
- [Cached Network Image](https://pub.dev/packages/cached_network_image) for caching images
- [Logger](https://pub.dev/packages/logger) for logging
- [Flutter Staggered Animations](https://pub.dev/packages/flutter_staggered_animations) for animations
- [Skeletons](https://pub.dev/packages/skeletons) for skeleton loading
