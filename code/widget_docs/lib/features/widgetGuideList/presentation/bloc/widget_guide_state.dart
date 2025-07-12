part of 'widget_guide_bloc.dart';

sealed class WidgetGuideState extends Equatable {
  const WidgetGuideState();

  @override
  List<Object> get props => [];
}

class WidgetGuideInitial extends WidgetGuideState {}

class WidgetGuideLoading extends WidgetGuideState {}

class WidgetGuideLoaded extends WidgetGuideState {
  final List<WidgetGuide> guides;
  const WidgetGuideLoaded(this.guides);
  @override
  List<Object> get props => [guides];
}

class WidgetGuideError extends WidgetGuideState {
  final String message;
  const WidgetGuideError(this.message);
  @override
  List<Object> get props => [message];
}
