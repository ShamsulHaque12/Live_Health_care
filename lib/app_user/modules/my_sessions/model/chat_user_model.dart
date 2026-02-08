class ChatUserModel {
  final String id;
  final String name;
  final String subtitle;
  final String avatar;
  bool isOnline;
  bool isBlocked;

  ChatUserModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.avatar,
    this.isOnline = false,
    this.isBlocked = false,
  });
}
