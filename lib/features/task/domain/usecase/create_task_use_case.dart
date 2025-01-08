import 'package:provider_clean/core/model/failure.dart';
import 'package:provider_clean/features/task/domain/repository/tasks_repository.dart';

import '../../../../core/model/either.dart';
import '../entity/task.dart';

class CreateTaskUseCase {
  final TasksRepository tasksRepository;

  CreateTaskUseCase({required this.tasksRepository});

  Future<Either<Failure, void>> call(Task task) async {
    return await tasksRepository.createTask(task);
  }
}
