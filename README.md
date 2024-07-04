# wearworld

This is an adaptation of the base flutter example to Wear OS devices.


## Build and run

1. Create a Wear OS virtual device.

	a) Download a Wear OS system image, for example, `system-images;android-33;android-wear;arm64-v8a` or `system-images;android-33;android-wear;x86_64`.

	b) Create a WearOS android virtual device using the previous image and a device configuration for a smartwatch. 
 Some generic device configurations included in the distribution are `wearos_large_round`, `wearos_rect`, `wearos_small_round` and `wear_os_square`.  

2. Open the virtual device with the emulator.

3. Build and run the project.

```
flutter build apk
flutter run 
```

   

## How the base app was adapted to Wear OS


### Required flutter packages
- [`wear_plus`](https://pub.dev/packages/wear_plus)

### Changes in  configuration files
- The minSdkVersion was manually set to 23 in the file `android/app/build.gradle`
```
   defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.wearworld"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdkVersion 23
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```
### Code details

The main page of the application can load two different pages:
- `AmbientPage`, that is loaded when the smartwatch switches to the ambient mode. It displays a static text.
- `ActivePage`, that contains the program logic.

Moreover, the shape of the smartwatch is detected in order to adapt the interface to the screen features.



## Troubleshooting

If the keyboard buttons in the emulator do not work, check [this](https://stackoverflow.com/questions/71330007/back-button-not-working-on-android-emulator)