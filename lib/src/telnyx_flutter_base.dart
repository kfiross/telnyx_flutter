import 'models/telnyx_creds.dart';
import 'repository/telnyx_sms_repository.dart';
import 'repository/telnyx_wa_repository.dart';
import 'utils/utils.dart';

class TelnyxFlutter {
  late TelnyxSmsRepository _smsRepository;
  late TelnyxWhatsappRepository _waRepository;

  TelnyxCreds? _telnyxCreds;

  /// Creates a TelnyxFlutter Object with [authToken] , [telnyxNumber].
  /// [authToken] ,[telnyxNumber]  Auth Token from https://portal.telnyx.com/#/app/home
  ///  Should be not null Strings.
  ///
  /// [telnyxNumber] can later be changed.
  TelnyxFlutter({
    required String authToken,
    required String telnyxNumber,
    required String messagingProfileId,
    String? whatappUserId,
  }) {
    _smsRepository = TelnyxSmsRepositoryImpl();

    _telnyxCreds = TelnyxCreds(
      apiKey: authToken,
      telnyxNumber: telnyxNumber,
      url: Utils.endpoint,
      messagingProfileId: messagingProfileId,
      whatappUserId: whatappUserId,
    );
  }

  ///	 [toNumber] : The number to which text message has to be sent.
  ///	 [messageBody] : The content of the message to be sent.
  ///
  ///	Method called to send text messages to the specified phone number with given content.
  ///
  /// Returns
  ///	200 -> message sent successfully.
  ///
  ///	For more status codes refer
  /// * https://developers.telnyx.com/docs/api/v2/overview/errors
  Future<int> sendSMS(
      {required String toNumber, required String messageBody}) async {
    return await _smsRepository.sendSMS(
        toNumber: toNumber,
        messageBody: messageBody,
        telnyxCreds: _telnyxCreds);
  }

  ///	 [toNumber] : The number to which text message has to be sent.
  ///	 [messageBody] : The content of the message to be sent.
  ///
  ///	Method called to send text messages to the specified phone number with given content.
  ///
  /// Returns
  ///	200 -> message sent successfully.
  ///
  ///	For more status codes refer
  /// * https://developers.telnyx.com/docs/api/v2/overview/errors
  Future<int> sendSMSWithSenderID(
      {required String senderId,
      required String toNumber,
      required String messageBody}) async {
    return await _smsRepository.sendSMSWithSenderID(
        toNumber: toNumber,
        senderId: senderId,
        messageBody: messageBody,
        telnyxCreds: _telnyxCreds);
  }

  ///	 [senderId] : A valid alphanumeric sender ID
  ///	 [toNumber] : The number to which text message has to be sent.
  ///	 [messageBody] : The content of the message to be sent.
  ///
  ///	Method called to send text messages to the specified phone number with given content.
  /// But with name instead
  ///
  /// Returns
  ///	200 -> message sent successfully.
  ///
  ///	For more status codes refer
  /// * https://developers.telnyx.com/docs/api/v2/overview/errors
  Future<int> sendWhatsApp(
      {required String toNumber, required String messageBody}) async {
    return await _waRepository.sendMessage(
      toNumber: toNumber,
      messageBody: messageBody,
      telnyxCreds: _telnyxCreds,
    );
  }
}
