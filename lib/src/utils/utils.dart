class Utils {
  static const String _baseUri = 'https://api.telnyx.com';
  static const String _version = 'v2';

  static String get endpoint => '$_baseUri/$_version';

  static String get sms_endpoint => 'messages';

  static String get whatsapp_endpoint => 'whatsapp_messages';
}
