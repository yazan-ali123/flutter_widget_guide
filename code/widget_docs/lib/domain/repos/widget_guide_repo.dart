import 'package:widget_docs/domain/entities/widget_guide.dart';

abstract class WidgetGuideRepo {
  Future<List<WidgetGuide>> getWidgets();
}
