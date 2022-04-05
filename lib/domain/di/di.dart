import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_flutter_masterclass/app/app_prefs.dart';
import 'package:mvvm_flutter_masterclass/data/api/app_api.dart';
import 'package:mvvm_flutter_masterclass/data/api/dio_factory.dart';
import 'package:mvvm_flutter_masterclass/data/api/network_info.dart';
import 'package:mvvm_flutter_masterclass/data/datasource/remote_data_source.dart';
import 'package:mvvm_flutter_masterclass/domain/repository/repository.dart';
import 'package:mvvm_flutter_masterclass/domain/repository/repository_impl.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/forget_password_use_case.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/login_use_case.dart';
import 'package:mvvm_flutter_masterclass/presentation/login/login_view_model/login_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/password/viewModel/forget_password_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModules() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  //app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(sharedPrefs));

  // network instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(instance()));
    instance.registerFactory<ForgetPasswordViewModel>(
        () => ForgetPasswordViewModel(instance()));
  }
}
