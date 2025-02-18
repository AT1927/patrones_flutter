import 'package:clean_architecture/domain/entities/volcano.dart';
import 'package:clean_architecture/presentation/bloc/volcano_bloc.dart';
import 'package:clean_architecture/presentation/bloc/volcano_event.dart';
import 'package:clean_architecture/presentation/bloc/volcano_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class VolcanoListPage extends StatefulWidget {
  const VolcanoListPage({super.key});

  @override
  State<VolcanoListPage> createState() => _VolcanoListPageState();
}

class _VolcanoListPageState extends State<VolcanoListPage> {
  final List<Volcano> predefinedVolcanoes = [
    Volcano(
      id: const Uuid().v4(),
      name: 'Galeras (Urkunina)',
      height: 4276.0,
      difficulty: 'Moderate - Preparation required. About 5 hours of ascent.',
    ),
    Volcano(
      id: const Uuid().v4(),
      name: 'Cumbal',
      height: 4764.0,
      difficulty:
          'High difficulty - Requires good physical condition and acclimatization. About 5 hours of ascent.',
    ),
    Volcano(
      id: const Uuid().v4(),
      name: 'Azufral (Laguna Verde)',
      height: 4070.0,
      difficulty: 'Easy difficulty - About 3 hours of ascent from the refuge.',
    ),
    Volcano(
      id: const Uuid().v4(),
      name: 'Chiles',
      height: 4723.0,
      difficulty:
          'Moderate difficulty - About 3 hours of ascent from the refuge.',
    ),
    Volcano(
      id: const Uuid().v4(),
      name: 'Cayambe',
      height: 5790.0,
      difficulty:
          'Challenging - Requires good physical condition and acclimatization for the snow. About 4 hours of ascent from the last refuge.',
    ),
    Volcano(
      id: const Uuid().v4(),
      name: 'Nevado del Huila',
      height: 5364.0,
      difficulty:
          'Challenging - Requires good physical condition and acclimatization for the snow. About 8 hours of ascent.',
    ),
    Volcano(
      id: const Uuid().v4(),
      name: 'Cotopaxi',
      height: 5897.0,
      difficulty:
          'Challenging - Requires good physical condition and acclimatization for the snow. About 5 hours of ascent from the last refuge.',
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volcanos'),
        leading: Icon(Icons.volcano),
      ),
      body: BlocBuilder<VolcanoBloc, VolcanoState>(
        builder: (context, state) {
          if (state is VolcanoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is VolcanoError) {
            return Center(child: Text(state.message));
          }
          if (state is VolcanoLoaded) {
            return ListView.builder(
              itemCount: state.volcanos.length,
              itemBuilder: (context, index) {
                final volcano = state.volcanos[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      volcano.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Height: ${volcano.height} m\nDifficulty: ${volcano.difficulty}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<VolcanoBloc>().add(
                              DeleteVolcanoEvent(volcano.id),
                            );
                      },
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No volcanos'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentIndex < predefinedVolcanoes.length) {
            context
                .read<VolcanoBloc>()
                .add(AddVolcano(predefinedVolcanoes[currentIndex]));
            setState(() {
              currentIndex = (currentIndex + 1) % predefinedVolcanoes.length;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
