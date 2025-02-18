import 'package:clean_architecture/domain/entities/volcano.dart';
import 'package:clean_architecture/domain/repositories/volcano_repository.dart';

class GetVolcanoById {
  final VolcanoRepository repository;

  GetVolcanoById(this.repository);

  Future<Volcano> execute(String id) async {
    return await repository.getVolcanoById(id);
  }
}
