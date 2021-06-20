import 'classifieds_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<ClassifiedsService>(() => ClassifiedsService());
}