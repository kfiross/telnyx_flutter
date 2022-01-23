import 'package:telnyx_flutter/telnyx_flutter.dart';

void main() {

  final toNumber = '+972000000000';
  final messageBody = 'Hello from Telnyx';

  var telnyxFlutter = TelnyxFlutter(
      telnyxNumber: '+___________',
      authToken: 'KEY*_*',
      messagingProfileId: '*-*-*-*-*'
  );

  telnyxFlutter.sendSMS(
      toNumber: toNumber, messageBody: messageBody).then((value) {
    print(value);
  });

  telnyxFlutter.sendSMSWithSenderID(
      senderId: 'SENDER_ID', toNumber: toNumber, messageBody: messageBody).then((value) {
    print(value);
  });



}
