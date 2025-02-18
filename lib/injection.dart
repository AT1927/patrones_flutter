import 'package:clean_architecture/data/repositories/volcano_repository_impl.dart';
import 'package:clean_architecture/domain/repositories/volcano_repository.dart';
import 'package:clean_architecture/domain/usecases/delete_volcano.dart';
import 'package:clean_architecture/domain/usecases/get_all_volcanos.dart';
import 'package:clean_architecture/domain/usecases/save_volcano.dart';
import 'package:clean_architecture/presentation/bloc/volcano_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  // Repositories
  getIt.registerLazySingleton<VolcanoRepository>(
    () => VolcanoRepositoryImpl(),
  );

  // Use Cases
  getIt.registerLazySingleton(
    () => GetAllVolcanos(getIt<VolcanoRepository>()),
  );
  getIt.registerLazySingleton(
    () => SaveVolcano(getIt<VolcanoRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteVolcano(getIt<VolcanoRepository>()),
  );

  // BLoCs
  getIt.registerFactory(
    () => VolcanoBloc(
      getAllVolcanos: getIt<GetAllVolcanos>(),
      saveVolcano: getIt<SaveVolcano>(),
      deleteVolcano: getIt<DeleteVolcano>(),
    ),
  );
}
