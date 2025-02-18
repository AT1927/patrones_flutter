import 'package:clean_architecture/domain/entities/volcano.dart';

abstract class VolcanoEvent {}

class LoadVolcanos extends VolcanoEvent {}

class AddVolcano extends VolcanoEvent {
  final Volcano volcano;
  AddVolcano(this.volcano);
}

class DeleteVolcanoEvent extends VolcanoEvent {
  final String id;
  DeleteVolcanoEvent(this.id);
}
