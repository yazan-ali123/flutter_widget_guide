part of 'widget_guide_bloc.dart';

abstract class WidgetGuideEvent extends Equatable {
  const WidgetGuideEvent();
  @override
  List<Object> get props => [];
}

class FetchWidgetGuides extends WidgetGuideEvent {}
