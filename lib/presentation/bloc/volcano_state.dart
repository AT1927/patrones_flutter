import 'package:clean_architecture/domain/entities/volcano.dart';

abstract class VolcanoState {}

class VolcanoInitial extends VolcanoState {}

class VolcanoLoading extends VolcanoState {}

class VolcanoLoaded extends VolcanoState {
  final List<Volcano> volcanos;
  VolcanoLoaded(this.volcanos);
}

class VolcanoError extends VolcanoState {
  final String message;
  VolcanoError(this.message);
}
