# Telnyx Flutter 

A Flutter package for both android and iOS which helps developers with Telnyx API services.

## Features

* Send SMS programmatically;

#### upcoming:

* Get all SMS related to a Telnyx account;
* Get more info on each SMS sent from a Telnyx account;
* Send WhatsApp messages programmatically;

## Getting Started

To use this package :

- add the dependency to your pubspec.yaml file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  telnyx_flutter: ^0.0.3
```

## How to use


#### Create a new client object
```dart
var telnyxFlutter = TelnyxFlutter(
    telnyxNumber : '[YOUR_TELNYX_NUMBER]',  // e.g: +............... 
    authToken : '[YOUR_TELNYX_API_KEY]',    // e.g: KEY****  
    messagingProfileId : '[YOUR_MESSAGING_PROFILE_ID]' // e.g: aaaaaaaa-bbbb-cccc-dddd-111111111111   
    );
```
#### Send SMS
```dart
twilioFlutter.sendSMS(
   toNumber : '+................', 
   messageBody : 'your message here'); 
```

#### Send SMS (Using Alphanumeric SenderID)

```dart
// for example using TELNYX
twilioFlutter.sendSMS(
   senderId: 'TELNYX'
   toNumber : '+................', 
   messageBody : 'your message here'); 
```

## Author

This Telnyx Flutter Package is developed by [Kfir Matityahu](https://github.com/kfiross).