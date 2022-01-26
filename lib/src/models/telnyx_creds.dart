class TelnyxCreds {
  final String apiKey;
  final String telnyxNumber;
  final String url;
  final String messagingProfileId;
  final String? whatappUserId;

  const TelnyxCreds({
    required this.apiKey,
    required this.telnyxNumber,
    required this.url,
    required this.messagingProfileId,
    this.whatappUserId,
  });
}
