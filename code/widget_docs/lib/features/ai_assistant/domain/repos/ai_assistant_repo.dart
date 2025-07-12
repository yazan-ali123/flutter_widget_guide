import 'package:widget_docs/features/ai_assistant/domain/entities/message.dart';

abstract class AiAssistantRepo {
  Future<Message> getResponse(String prompt);
}
