import 'package:clean_architecture/domain/repositories/volcano_repository.dart';

class DeleteVolcano {
  final VolcanoRepository repository;

  DeleteVolcano(this.repository);

  Future<void> execute(String id) async {
    await repository.deleteVolcano(id);
  }
}
