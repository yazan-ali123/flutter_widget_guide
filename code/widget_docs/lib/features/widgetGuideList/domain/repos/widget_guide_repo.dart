import 'package:widget_docs/features/widgetGuideList/domain/entities/widget_guide.dart';

abstract class WidgetGuideRepo {
  Future<List<WidgetGuide>> getWidgets();
}
