import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:widget_docs/features/ai_assistant/data/models/message_model.dart';

abstract class AiAssistantRemoteDataSource {
  Future<MessageModel> getAiResponse(String prompt);
}

class AiAssistantRemoteDataSourceImpl implements AiAssistantRemoteDataSource {
  final String _apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyDVU9Nj8f16tPBU_K74iC6CFvfFAuHiZII";

  @override
  Future<MessageModel> getAiResponse(String prompt) async {
    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': prompt},
          ],
        },
      ],
    });
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MessageModel(
        text: data['candidates'][0]['content']['parts'][0]['text'],
        isUser: false,
      );
    } else {
      throw Exception('API request failed');
    }
  }
}
