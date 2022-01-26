# Telnyx Flutter 

A Flutter (dart) package for helping developers using the Telnyx API services

## Features

* Send SMS programmatically
* Send WhatsApp messages programmatically

#### upcoming:

* Get all SMS related to a Telnyx account
* Get more info on each SMS sent from a Telnyx account

## Getting Started

To use this package :

- add the dependency to your pubspec.yaml file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  telnyx_flutter: ^0.0.5
```

## How to use


#### Create a new client object
```dart
var telnyxFlutter = TelnyxFlutter(
  telnyxNumber : '[YOUR_TELNYX_NUMBER]',  // e.g: +............... 
  authToken : '[YOUR_TELNYX_API_KEY]',    // e.g: KEY****  
  messagingProfileId : '[YOUR_MESSAGING_PROFILE_ID]', // e.g: aaaaaaaa-bbbb-cccc-dddd-111111111111
  whatappUserId: ['WHATSUP_USER_ID']    // (optional)   
);
```
#### Send SMS
```dart
telnyxFlutter.sendSMS(
  toNumber : '+................', 
  messageBody : 'your message here',
); 
```

#### Send SMS (Using Alphanumeric SenderID)

```dart
// for example using TELNYX
telnyxFlutter.sendSMS(
  senderId: 'TELNYX'
  toNumber : '+................', 
  messageBody : 'your message here',
); 
```

#### Send Whatsapp SMS (Using Alphanumeric SenderID)

```dart
// for example using TELNYX
telnyxFlutter.sendWhatsApp(
  toNumber : '+................', 
  messageBody : 'your WA message here',
);
```


## Author

This Telnyx Flutter Package is developed by [Kfir Matityahu](https://github.com/kfiross).