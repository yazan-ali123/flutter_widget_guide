import 'package:widget_docs/features/widgetGuideList/data/datasources/widget_guide_local_data_source.dart';
import 'package:widget_docs/features/widgetGuideList/domain/entities/widget_guide.dart';
import 'package:widget_docs/features/widgetGuideList/domain/repos/widget_guide_repo.dart';

class WidgetGuideRepositoryImpl implements WidgetGuideRepo {
  final WidgetGuideLocalDataSource localDataSource;

  WidgetGuideRepositoryImpl({required this.localDataSource});

  @override
  Future<List<WidgetGuide>> getWidgets() async {
    return await localDataSource.getWidgetGuides();
  }
}
