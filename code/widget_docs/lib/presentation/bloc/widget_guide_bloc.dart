import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widget_docs/domain/entities/widget_guide.dart';
import 'package:widget_docs/domain/usecases/get_widget_guides.dart';

part 'widget_guide_event.dart';
part 'widget_guide_state.dart';

class WidgetGuideBloc extends Bloc<WidgetGuideEvent, WidgetGuideState> {
  final GetWidgetGuides getWidgetGuides;
  WidgetGuideBloc(this.getWidgetGuides) : super(WidgetGuideInitial()) {
    on<FetchWidgetGuides>((event, emit) async {
      emit(WidgetGuideLoading());
      try {
        final guides = await getWidgetGuides();
        emit(WidgetGuideLoaded(guides));
      } catch (e) {
        emit(WidgetGuideError(e.toString()));
      }
    });
  }
}
