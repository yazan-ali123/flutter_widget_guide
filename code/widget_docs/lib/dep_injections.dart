import 'package:get_it/get_it.dart';
import 'package:widget_docs/data/datasources/widget_guide_local_data_source.dart';
import 'package:widget_docs/data/repos/widget_guide_repository_impl.dart';
import 'package:widget_docs/domain/repos/widget_guide_repo.dart';
import 'package:widget_docs/domain/usecases/get_widget_guides.dart';
import 'package:widget_docs/presentation/bloc/widget_guide_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => WidgetGuideBloc(sl()));
  sl.registerLazySingleton<WidgetGuideRepo>(
    () => WidgetGuideRepositoryImpl(localDataSource: sl()),
  );

  sl.registerLazySingleton(() => GetWidgetGuides(repo: sl()));

  sl.registerLazySingleton<WidgetGuideLocalDataSource>(
    () => WidgetGuideLocalDataSourceImpl(),
  );
}
