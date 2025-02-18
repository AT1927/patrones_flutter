import 'package:clean_architecture/data/repositories/volcano_repository_impl.dart';
import 'package:clean_architecture/domain/usecases/delete_volcano.dart';
import 'package:clean_architecture/domain/usecases/get_all_volcanos.dart';
import 'package:clean_architecture/domain/usecases/save_volcano.dart';
import 'package:clean_architecture/presentation/bloc/volcano_bloc.dart';
import 'package:clean_architecture/presentation/bloc/volcano_event.dart';
import 'package:clean_architecture/presentation/pages/volcano_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Crear instancias de las dependencias
    final volcanoRepository = VolcanoRepositoryImpl();
    final getAllVolcanos = GetAllVolcanos(volcanoRepository);
    final saveVolcano = SaveVolcano(volcanoRepository);
    final deleteVolcano = DeleteVolcano(volcanoRepository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica Patrones Flutter - Torres',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: BlocProvider(
        create: (context) => VolcanoBloc(
          getAllVolcanos: GetAllVolcanos(volcanoRepository),
          saveVolcano: SaveVolcano(volcanoRepository),
          deleteVolcano: DeleteVolcano(volcanoRepository),
        )..add(LoadVolcanos()),
        child: const VolcanoListPage(),
      ),
    );
  }
}
