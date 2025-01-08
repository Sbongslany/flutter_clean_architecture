import 'package:provider_clean/core/model/failure.dart';
import 'package:provider_clean/features/task/domain/entity/task.dart';

import '../../../../core/model/either.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, Task>> getTaskById(int id);
  Future<Either<Failure, void>> createTask(Task task);
  Future<Either<Failure, void>> updateTask(Task task);
  Future<Either<Failure, void>> deleteTask(int id);
}
