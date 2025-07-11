import 'package:widget_docs/domain/entities/widget_guide.dart';
import 'package:widget_docs/domain/repos/widget_guide_repo.dart';

class GetWidgetGuides {
  final WidgetGuideRepo repo;

  GetWidgetGuides({required this.repo});
  Future<List<WidgetGuide>> call() async {
    return await repo.getWidgets();
  }
}
