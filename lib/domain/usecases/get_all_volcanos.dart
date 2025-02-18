import 'package:clean_architecture/domain/entities/volcano.dart';
import 'package:clean_architecture/domain/repositories/volcano_repository.dart';

class GetAllVolcanos {
  final VolcanoRepository repository;

  GetAllVolcanos(this.repository);

  Future<List<Volcano>> execute() async {
    return await repository.getAllVolcanos();
  }
}
