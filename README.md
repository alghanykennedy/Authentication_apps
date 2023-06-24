# Authentication Flutter Apps

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/6acc1bbc-9d52-4c7d-9ee5-366b0141d230)

Authentication Flutter App is a simple auth method application built with Flutter 3.0 and powered by the GetX pattern for state management. This app allows you to create account, login and view a list of User with smooth animations.

## Features

### 1. Welcome Screen

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/0c4e89c3-884a-4fb4-b39c-fe4c5072dd21)

This feature allows you to choose signup or login before you go forward to home screen.

### 2. Signup Screen

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/e7b3f6ba-a1d4-4ee5-ab39-8e291b2eba3b)

Don't have account? Don't worry just create new one, it's free!

### 3. Login Screen

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/6f84520b-c68f-48bb-80ac-1e24138f010a)

If you already have account or you success to signup, try to login glad to see you back.

### 4. Home Screen

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/4bd5754b-e7c1-4038-98a0-7f94a9ec9d79)

This feature allows you to scroll through a list of User. Each User is displayed in a listview smoothly into view.

### 5. Validator

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/e554e35a-d31d-44fb-8085-06d08ad786b2)

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/64522b0d-9f40-47fb-88a4-a6b30f2685dd)

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/2f0cbebb-7049-4625-9b82-9ea3db437d81)

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/6f774f9c-0ad0-4c55-b48b-0a41e53bb6a6)

![image](https://github.com/alghanykennedy/Authentication_apps/assets/82708330/923a5c80-d84d-42df-8956-ff58cebc6e74)

In the event of a problem (such as email already register, password less than 6 character, wrong email or password), the app shows a custom error dialog with message. This dialog provides a more personalized and user-friendly error handling.

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
- [Dio](https://pub.dev/packages/dio) for provides a clean and efficient API for making HTTP requests
- [Http](https://pub.dev/packages/http) for sending or fetching data to and from the internet
- [Shared_Preferences](https://pub.dev/packages/shared_preferences) for reading and writing simple key-value pairs
- [Infinite_Scroll_Pagination](https://pub.dev/packages/infinite_scroll_pagination) for handle paginating your data for an infinite scroll operation
