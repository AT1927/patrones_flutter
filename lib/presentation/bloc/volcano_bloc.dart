import 'package:clean_architecture/domain/usecases/delete_volcano.dart';
import 'package:clean_architecture/domain/usecases/get_all_volcanos.dart';
import 'package:clean_architecture/domain/usecases/save_volcano.dart';
import 'package:clean_architecture/presentation/bloc/volcano_event.dart';
import 'package:clean_architecture/presentation/bloc/volcano_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolcanoBloc extends Bloc<VolcanoEvent, VolcanoState> {
  final GetAllVolcanos getAllVolcanos;
  final SaveVolcano saveVolcano;
  final DeleteVolcano deleteVolcano;

  VolcanoBloc({
    required this.getAllVolcanos,
    required this.saveVolcano,
    required this.deleteVolcano,
  }) : super(VolcanoInitial()) {
    on<LoadVolcanos>(_onLoadVolcanos);
    on<AddVolcano>(_onAddVolcano);
    on<DeleteVolcanoEvent>(_onDeleteVolcano);
  }

  Future<void> _onLoadVolcanos(
    LoadVolcanos event,
    Emitter<VolcanoState> emit,
  ) async {
    emit(VolcanoLoading());
    try {
      final volcanos = await getAllVolcanos.execute();
      emit(VolcanoLoaded(volcanos));
    } catch (e) {
      emit(VolcanoError(e.toString()));
    }
  }

  Future<void> _onAddVolcano(
    AddVolcano event,
    Emitter<VolcanoState> emit,
  ) async {
    emit(VolcanoLoading());
    try {
      await saveVolcano.execute(event.volcano);
      final volcanos = await getAllVolcanos.execute();
      emit(VolcanoLoaded(volcanos));
    } catch (e) {
      emit(VolcanoError(e.toString()));
    }
  }

  Future<void> _onDeleteVolcano(
    DeleteVolcanoEvent event,
    Emitter<VolcanoState> emit,
  ) async {
    emit(VolcanoLoading());
    try {
      await deleteVolcano.execute(event.id);
      final volcanos = await getAllVolcanos.execute();
      emit(VolcanoLoaded(volcanos));
    } catch (e) {
      emit(VolcanoError(e.toString()));
    }
  }
}
