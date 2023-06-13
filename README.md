# earnipay :gift_heart:

- A  Flutter app that fetches a paginated list of images from a remote repository.


## About App :+1:

This app fetches a paginated list of images and displays them lazily on the home page.

More images are being fetched when the user scrolls to the bottom of the list.

When a user clicks on an image, the app navigates to a new screen where the image is displayed in a larger form with its details.

The application is responsive on both Android and iOs mobile devices whether on landscape or portrait mode.



## State Management :star_struck:

The app uses [bloc state management](https://pub.dev/packages/flutter_bloc) approach.

Every screen belongs to its own module and a module has a bloc folder where the Bloc, State and Event class live.
Every module also has a view where the UI for the module lives.

The app uses [http package](https://pub.dev/packages/http) for making network calls.

## :muscle: Performance Optimization :muscle:

I ensured I used ***const*** where necessary for widgets so widgets do not rebuild when its state has not changed.

For the list of images and titles, I used [CustomScrollView](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html) so the list could be rendered efficiently and customisable and to ensure the images are cached so they are not always fetched anytime the user goes to the home page, I used ***SliverGrid*** with ***SliverChildBuilderDelegate*** as its delegate. The ***SliverChildBuilderDelegate*** has parameters ***addAutomaticKeepAlives*** set to **true**, to make sure the children are always **alive** and ***addRepaintBoundaries*** set to ***true*** so the **children** do not always need to repaint when the list scrolls. And such children could be effortlessly displayed on the screen.

## :surfing_man: Testing :horse_racing:
Testing is a crucial part of every application development. It ensures the different edge cases of 
the app is well taken care of.

[Earnipay](https://github.com/ernestkoko/earnipay) uses [bloc_test](https://pub.dev/packages/bloc_test/example) and ***flutter_test*** for both widgets and bloc testings.

This app has three categories of tests as outlined below with descriptions on what they do and how to run them.

1. Unit test
    - This test a single component of the app. It could be testing a single button, widgets, checking if a component or unit is present or doing what is it suppose to do.
    - To run this test just copy and paste :point_right: `flutter test`  on your terminal. It executes all the unit tests in the ***test folder***

2. Integration test
    - This bootstraps the application and and runs it on a connected `Android emulator`,  `iOs simulator` or a real device connected to the `code editor` of choice. SO to run this test, one has to have a a device connected or have an `emualtor` or `simulator`.
    - To run this test you need to you need to open your terminal, navigate to your project root and then copy and paste :point_right:  `flutter test integration_test/app_test.dart` and then click the ***ENTER*** key on your keyboard'

3. App performance test
    - When you look at the `integration_test` folder at the root of the project you will find another 
    file named `perf_test.dart`. This file test the entire performance of the application. it tests if the app
    draws its 60 frames per second (60 FPS) or it is lagging behind with serious performance issues.
    
    - To capture the result of this test, there is another file,`perf_driver.dart` in the `test_driver` folder at the root of the project.
    This file helps to collate the result of the performance test and drops it in the respective `platform folders` at the root of the project. 
    `e.g for Android it drops it in the 'android/build/'` folder. If you successfully run the test
    , open the folder and you can see two files, `scrolling_summary.timeline.json` and `scrolling_summary.timeline_summary.json`.
    These two files can be analysed to get a close-to-user experience on how the app performs on a user's device.
    - To run this test, go to the root of the project on terminal, copy and paste :point_right: `flutter drive \
      --driver=test_driver/perf_driver.dart \
      --target=integration_test/perf_test.dart \
      --profile \
      --no-dds`  after running your `emulator`, `simulator` or device and click `ENTER` on your keyboard


## :white_check_mark: How to run the app 
You can run this app on either Android or iOs mobile phone.
You have to download either [VS code](https://code.visualstudio.com/download) or [Android Studio](https://developer.android.com/studio?gclid=CjwKCAjwvpCkBhB4EiwAujULMuW99G8v2aZbcrnfO4QFAiS7IIBnn3_dHMPOa0fSoroNEaxl-x2SmRoC-HwQAvD_BwE&gclsrc=aw.ds) by clicking on any of the links :point_left:  and following the official installation guide. 

After successful installation of [VS code](https://code.visualstudio.com/download) or [Android Studio](https://developer.android.com/studio?gclid=CjwKCAjwvpCkBhB4EiwAujULMuW99G8v2aZbcrnfO4QFAiS7IIBnn3_dHMPOa0fSoroNEaxl-x2SmRoC-HwQAvD_BwE&gclsrc=aw.ds),  install [Flutter](https://docs.flutter.dev/get-started/editor?tab=vscode) by following the guide [here](https://docs.flutter.dev/get-started/editor?tab=vscode), then you can clone this [app](https://github.com/ernestkoko/earnipay) and run to enjoy nice views.

Please remember to create an account with [Unsplash](https://unsplash.com/documentation#registering-your-application) and append your client_id from [Unsplash](https://unsplash.com/documentation#registering-your-application) to the baseUrl on line ***8*** in the [***photo_service.dart***](https://github.com/ernestkoko/earnipay/blob/main/lib/app/data/services/photo/photo_service.dart) file in the [***lib/app/data/services/photo***](https://github.com/ernestkoko/earnipay/tree/main/lib/app/data/services/photo) folder.

## :people_hugging: Let's snap the app...

# List page
![alt image1](image1.png)___

# Details page
![alt image2](image2.png)