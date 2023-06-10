# earnipay :gift_heart:

A  Flutter app that fetches a paginated list of images from a remote repository.


## About App :+1:

This app displays a paginated list of images and displays them lazily on the home page.

More images are being fetched when the user scrolls to the bottom of the list.

When a user clicks on an image, the app navigates to a new screen where the image is displayed in a larger form with its details.

The application is responsive on both Android and iOs mobile devices.



## State Management :star_struck:

The app uses [bloc state management](https://pub.dev/packages/flutter_bloc) approach.

Every screen belongs to its own module and a module has a bloc folder where the Bloc, State and Event class live.
Every module also has a view where the UI for the module lives.

The app uses [http package](https://pub.dev/packages/http) for making network calls.

## :muscle: Performance Optimization :muscle:

I ensured I used const where necessary for widgets so widgets do not rebuild when its state has not changed.

For the list of images and titles, I used [CustomScrollView](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html) so the list could be rendered efficiently and customisable and the images are cached to ensure they are not always fetched anytime the user goes to the home page. And such cached image could be effortlessly displayed on the image details page.
 ## :surfing_man: Testing :horse_racing:

## :white_check_mark: How to run the app 
You can run this app on either Android or iOs mobile phone.
Your have to download either [VS code](https://code.visualstudio.com/download) or [Android Studio](https://developer.android.com/studio?gclid=CjwKCAjwvpCkBhB4EiwAujULMuW99G8v2aZbcrnfO4QFAiS7IIBnn3_dHMPOa0fSoroNEaxl-x2SmRoC-HwQAvD_BwE&gclsrc=aw.ds) by clicking on any of the links :point_left:  and following the official installation guide. 

Having done that you need to install [Flutter](https://docs.flutter.dev/get-started/editor?tab=vscode) by following the guide [here](https://docs.flutter.dev/get-started/editor?tab=vscode) you can clone this app and run to enjoy nice views.

Please remember to create an account with [Unsplash](https://unsplash.com/documentation#registering-your-application) and append your client_id from [Unsplash](https://unsplash.com/documentation#registering-your-application) to the baseUrl on line 8 in the *photo_service.dart* file in the *lib/app/data/services/photo* folder.

## :people_hugging: Let's snap the app...

# List page
![alt image1](image1.png)___

# Details page
![alt image2](image2.png)