import 'package:widget_docs/features/ai_assistant/domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel({required super.text, required super.isUser});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(text: json['text'], isUser: json['isUser']);
  }
  Map<String, dynamic> toJson() {
    return {'text': text, 'isUser': isUser};
  }
}
