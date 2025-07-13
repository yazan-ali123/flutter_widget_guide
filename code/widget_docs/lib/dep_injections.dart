import 'package:get_it/get_it.dart';
import 'package:widget_docs/features/ai_assistant/data/data_sources/remote/ai_assistant_remote_datasource.dart';
import 'package:widget_docs/features/ai_assistant/data/repos/ai_assistant_repo_imbl.dart';
import 'package:widget_docs/features/ai_assistant/domain/repos/ai_assistant_repo.dart';
import 'package:widget_docs/features/ai_assistant/domain/usecases/get_response.dart';
import 'package:widget_docs/features/ai_assistant/presentation/bloc/ai_assistant_bloc.dart';
import 'package:widget_docs/features/widgetGuideList/data/datasources/widget_guide_local_data_source.dart';
import 'package:widget_docs/features/widgetGuideList/data/repos/widget_guide_repository_impl.dart';
import 'package:widget_docs/features/widgetGuideList/domain/repos/widget_guide_repo.dart';
import 'package:widget_docs/features/widgetGuideList/domain/usecases/get_widget_guides.dart';
import 'package:widget_docs/features/widgetGuideList/presentation/bloc/widget_guide_bloc.dart';

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
  sl.registerFactory(() => AiAssistantBloc(sl()));
  sl.registerLazySingleton<AiAssistantRepo>(() => AiAssistantRepoImbl(sl()));
  sl.registerLazySingleton(() => GetResponse(sl()));
  sl.registerLazySingleton<AiAssistantRemoteDataSource>(
    () => AiAssistantRemoteDataSourceImpl(),
  );
}
