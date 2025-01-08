import 'package:provider_clean/core/model/failure.dart';
import 'package:provider_clean/features/task/domain/entity/task.dart';
import 'package:provider_clean/features/task/domain/repository/tasks_repository.dart';

import '../../../../core/model/either.dart';

class UpdateTaskUseCase {
  final TasksRepository tasksRepository;

  UpdateTaskUseCase({required this.tasksRepository});

  Future<Either<Failure, void>> call(Task task) async {
    return await tasksRepository.updateTask(task);
  }
}
