import 'package:clean_architecture/domain/entities/volcano.dart';
import 'package:clean_architecture/domain/repositories/volcano_repository.dart';

class SaveVolcano {
  final VolcanoRepository repository;

  SaveVolcano(this.repository);

  Future<void> execute(Volcano volcano) async {
    await repository.saveVolcano(volcano);
  }
}
