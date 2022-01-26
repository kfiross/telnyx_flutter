import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telnyx_flutter/src/models/telnyx_creds.dart';
import '../utils/utils.dart';

abstract class TelnyxWhatsappRepository {
  Future<int> sendMessage({
    required String toNumber,
    required String messageBody,
    required TelnyxCreds? telnyxCreds,
  });
}

class TelnyxWhatsappRepositoryImpl extends TelnyxWhatsappRepository {
  final http.Client client = http.Client();

  @override
  Future<int> sendMessage({
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
      'whatsapp_user_id': telnyxCreds.whatappUserId,
      'from': telnyxCreds.telnyxNumber,
      'to': toNumber,
      'type': 'text',
      'recipient_type': 'individual',
      'text': {'body': messageBody},
    };

    var response = await http.post(
      Uri.parse('${telnyxCreds.url}/${Utils.whatsapp_endpoint}'),
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode < 400) {
      print('Whatsapp sent Successfuly');
      return response.statusCode;
    } else {
      print('Sending Whatsapp Failed');
      print(response.body);
      //ErrorData errorData = ErrorData.fromJson(jsonDecode(response.body));
      //print('Error Code : ' + errorData.code.toString());
      //print('Error Message : ' + errorData.message!);
      //print("More info : " + errorData.moreInfo!);
      throw Exception();
    }
  }
}
