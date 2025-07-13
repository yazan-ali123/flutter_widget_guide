import 'package:widget_docs/features/ai_assistant/data/data_sources/remote/ai_assistant_remote_datasource.dart';
import 'package:widget_docs/features/ai_assistant/domain/entities/message.dart';
import 'package:widget_docs/features/ai_assistant/domain/repos/ai_assistant_repo.dart';

class AiAssistantRepoImbl extends AiAssistantRepo {
  final AiAssistantRemoteDataSource datasource;

  AiAssistantRepoImbl(this.datasource);
  @override
  Future<Message> getResponse(List<Message> messages) async {
    return await datasource.getAiResponse(messages);
  }
}
