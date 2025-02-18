import 'package:clean_architecture/domain/entities/volcano.dart';
import 'package:clean_architecture/domain/repositories/volcano_repository.dart';
//import 'package:clean_architecture/domain/usecases/save_volcano.dart';

class VolcanoRepositoryImpl implements VolcanoRepository {
  final List<Volcano> _volcanos = [];

  @override
  Future<List<Volcano>> getAllVolcanos() async {
    // Simulando delay de red
    await Future.delayed(const Duration(milliseconds: 500));
    return _volcanos;
  }

  @override
  Future<Volcano> getVolcanoById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _volcanos.firstWhere(
      (volcano) => volcano.id == id,
      orElse: () => throw Exception('Volcano not found'),
    );
  }

  @override
  Future<void> saveVolcano(Volcano volcano) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _volcanos.indexWhere((p) => p.id == volcano.id);
    if (index >= 0) {
      _volcanos[index] = volcano;
    } else {
      _volcanos.add(volcano);
    }
  }

  @override
  Future<void> deleteVolcano(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _volcanos.removeWhere((volcano) => volcano.id == id);
  }
}
