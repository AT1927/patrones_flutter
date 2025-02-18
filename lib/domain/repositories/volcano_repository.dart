import 'package:clean_architecture/domain/entities/volcano.dart';

abstract class VolcanoRepository {
  Future<List<Volcano>> getAllVolcanos();
  Future<Volcano> getVolcanoById(String id);
  Future<void> saveVolcano(Volcano volcano);
  Future<void> deleteVolcano(String id);
}
