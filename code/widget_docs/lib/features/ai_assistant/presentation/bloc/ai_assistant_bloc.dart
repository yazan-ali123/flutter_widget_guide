import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widget_docs/features/ai_assistant/domain/entities/message.dart';
import 'package:widget_docs/features/ai_assistant/domain/usecases/get_response.dart';

part 'ai_assistant_event.dart';
part 'ai_assistant_state.dart';

class AiAssistantBloc extends Bloc<AiAssistantEvent, AiAssistantState> {
  final GetResponse getResponse;
  AiAssistantBloc(this.getResponse) : super(AiAssistantState()) {
    on<SendMessage>((event, emit) async {
      final Message userMessage = Message(text: event.message, isUser: true);
      emit(
        state.copyWith(
          messages: [...state.messages, userMessage],
          isLoading: true,
        ),
      );
      try {
        final aiResponseText = await getResponse.call([
          ...state.messages,
          Message(text: event.message, isUser: true),
        ]);

        emit(
          state.copyWith(
            messages: [...state.messages, aiResponseText],
            isLoading: false,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            messages: [
              ...state.messages,
              Message(text: e.toString(), isUser: false),
            ],
            isLoading: false,
          ),
        );
      }
    });
  }
}
