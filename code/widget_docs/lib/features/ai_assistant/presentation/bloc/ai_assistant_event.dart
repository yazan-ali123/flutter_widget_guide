part of 'ai_assistant_bloc.dart';

sealed class AiAssistantEvent extends Equatable {
  const AiAssistantEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends AiAssistantEvent {
  final String message;

  const SendMessage({required this.message});
}
