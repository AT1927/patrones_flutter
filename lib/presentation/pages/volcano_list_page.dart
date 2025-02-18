import 'package:clean_architecture/domain/entities/volcano.dart';
import 'package:clean_architecture/presentation/bloc/volcano_bloc.dart';
import 'package:clean_architecture/presentation/bloc/volcano_event.dart';
import 'package:clean_architecture/presentation/bloc/volcano_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class VolcanoListPage extends StatelessWidget {
  const VolcanoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volcanos'),
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
                return ListTile(
                  title: Text(volcano.name),
                  subtitle: Text('\$${volcano.height}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<VolcanoBloc>().add(
                            DeleteVolcanoEvent(volcano.id),
                          );
                    },
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
          final volcano = Volcano(
            id: const Uuid().v4(),
            name: 'New Volcano ${DateTime.now().millisecondsSinceEpoch}',
            height: 4256.56,
            difficulty: 'A new volcano difficulty description',
          );
          context.read<VolcanoBloc>().add(AddVolcano(volcano));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
