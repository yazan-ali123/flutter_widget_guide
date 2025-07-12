part of 'ai_assistant_bloc.dart';

class AiAssistantState extends Equatable {
  final List<Message> messages;
  final bool isLoading;
  const AiAssistantState({this.messages = const [], this.isLoading = false});

  AiAssistantState copyWith({List<Message>? messages, bool? isLoading}) {
    return AiAssistantState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [messages, isLoading];
}
