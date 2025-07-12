import 'package:widget_docs/features/ai_assistant/domain/entities/message.dart';
import 'package:widget_docs/features/ai_assistant/domain/repos/ai_assistant_repo.dart';

class GetResponse {
  final AiAssistantRepo repo;
  GetResponse(this.repo);
  Future<Message> call(List<Message> messages) async {
    return await repo.getResponse(messages);
  }
}
