enum MessageStatus { sent, delivered, read, sending }

class MessageModel {
  final String id;
  final String text;
  final bool isMe;
  final DateTime time;
  final MessageStatus status;

  MessageModel({
    required this.id,
    required this.text,
    required this.isMe,
    required this.time,
    this.status = MessageStatus.sent,
  });

  MessageModel copyWith({
    String? id,
    String? text,
    bool? isMe,
    DateTime? time,
    MessageStatus? status,
  }) {
    return MessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }
}
