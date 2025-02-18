import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/presentation/bloc/volcano_bloc.dart';
import 'package:clean_architecture/presentation/bloc/volcano_event.dart';
import 'package:clean_architecture/presentation/pages/volcano_list_page.dart';
/*import 'package:clean_architecture/data/repositories/volcano_repository_impl.dart';
import 'package:clean_architecture/domain/usecases/delete_volcano.dart';
import 'package:clean_architecture/domain/usecases/get_all_volcanos.dart';
import 'package:clean_architecture/domain/usecases/save_volcano.dart';*/

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica Patrones Flutter - Torres',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: BlocProvider(
        create: (context) => getIt<VolcanoBloc>()..add(LoadVolcanos()),
        child: const VolcanoListPage(),
      ),
    );
  }
}
