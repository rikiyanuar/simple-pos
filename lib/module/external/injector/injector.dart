import '../../data/datasources/remote/app_remote_data_source.dart';
import '../../data/repositories/app_repository_impl.dart';
import '../../domain/repositories/app_repository.dart';
import '../../domain/use_case/app_usecases.dart';
import '../constants/app_constant.dart';
import '../libraries/libraries.dart';
import '../service/dio_client.dart';
import '../service/service_helper.dart';

final instance = GetIt.instance;

initInjector() {
  instance.registerLazySingleton<DioClient>(
    () => DioClient(),
  );
  instance.registerLazySingleton<ServiceHelper>(
    () => ServiceHelperImpl(
      dio: GetIt.I.get<DioClient>().dio,
    ),
  );
  instance.registerLazySingleton<AppRemoteDataSource>(
    () => AppRemoteDataSourceImpl(
      serviceHelper: GetIt.I.get<ServiceHelper>(),
      baseUrl: AppConstants.baseUrl,
    ),
  );
  instance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      remoteDataSource: GetIt.I.get<AppRemoteDataSource>(),
    ),
  );
  instance.registerLazySingleton<AppUseCase>(
    () => AppUseCaseImpl(
      repository: GetIt.I.get<AppRepository>(),
    ),
  );
}
