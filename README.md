## earnipay

A  Flutter app that fetches a paginated list of images from a remote repository.

## About App

This app displays a paginated list of images and displays them lazily on the home page.

More images are being fetched when the user scrolls to the bottom of the list.

When a user clicks on an image, the app navigates to a new screen where the image is displayed in a larger form with its details.

## State Management

The app uses [bloc state management](https://pub.dev/packages/flutter_bloc) approach.

Every screen belongs to its own module and a module has a bloc folder where the Bloc, State and Event class live.
Every module also has a view where the UI for the module live.

The app uses [http package](https://pub.dev/packages/http) for making network calls.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
