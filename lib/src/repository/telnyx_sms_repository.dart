import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telnyx_flutter/src/models/telnyx_creds.dart';
import '../utils/utils.dart';

abstract class TelnyxSmsRepository {
  Future<int> sendSMS({
    required String toNumber,
    required String messageBody,
    required TelnyxCreds? telnyxCreds,
  });

  Future<int> sendSMSWithSenderID({
    required String senderId,
    required String toNumber,
    required String messageBody,
    required TelnyxCreds? telnyxCreds,
  });
}

class TelnyxSmsRepositoryImpl extends TelnyxSmsRepository {
  final http.Client client = http.Client();

  @override
  Future<int> sendSMS({
    required String toNumber,
    required String messageBody,
    required TelnyxCreds? telnyxCreds,
  }) async {
    var apiKey = telnyxCreds!.apiKey;

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    var body = {
      'from': telnyxCreds.telnyxNumber,
      'to': toNumber,
      'text': messageBody,
    };
    var response = await http.post(
      Uri.parse('${telnyxCreds.url}/${Utils.sms_endpoint}'),
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode < 400) {
      print('Sms sent Success');
      return response.statusCode;
    } else {
      print('Sending Failed');
      print(response.body);
      //ErrorData errorData = ErrorData.fromJson(jsonDecode(response.body));
      //print('Error Code : ' + errorData.code.toString());
      //print('Error Message : ' + errorData.message!);
      //print("More info : " + errorData.moreInfo!);
      throw Exception();
    }
  }

  @override
  Future<int> sendSMSWithSenderID({
    required String senderId,
    required String toNumber,
    required String messageBody,
    required TelnyxCreds? telnyxCreds,
  }) async {
    var apiKey = telnyxCreds!.apiKey;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    var body = {
      'from': senderId,
      'to': toNumber,
      'text': messageBody,
      'messaging_profile_id': telnyxCreds.messagingProfileId
    };
    var response = await http.post(
      Uri.parse(telnyxCreds.url),
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode < 400) {
      print('Sms sent Success');
      return response.statusCode;
    } else {
      print('Sending Failed');
      print(response.body);
      //ErrorData errorData = ErrorData.fromJson(jsonDecode(response.body));
      //print('Error Code : ' + errorData.code.toString());
      //print('Error Message : ' + errorData.message!);
      //print("More info : " + errorData.moreInfo!);
      throw Exception();
    }
  }
}
