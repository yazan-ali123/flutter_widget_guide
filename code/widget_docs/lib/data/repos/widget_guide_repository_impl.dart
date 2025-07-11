import 'package:widget_docs/data/datasources/widget_guide_local_data_source.dart';
import 'package:widget_docs/domain/entities/widget_guide.dart';
import 'package:widget_docs/domain/repos/widget_guide_repo.dart';

class WidgetGuideRepositoryImpl implements WidgetGuideRepo {
  final WidgetGuideLocalDataSource localDataSource;

  WidgetGuideRepositoryImpl({required this.localDataSource});

  @override
  Future<List<WidgetGuide>> getWidgets() async {
    return await localDataSource.getWidgetGuides();
  }
}
