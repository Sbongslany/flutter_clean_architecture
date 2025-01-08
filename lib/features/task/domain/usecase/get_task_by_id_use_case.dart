import 'package:provider_clean/core/model/failure.dart';
import 'package:provider_clean/features/task/domain/repository/tasks_repository.dart';

import '../../../../core/model/either.dart';
import '../entity/task.dart';

class GetTaskByIdUseCase {
  final TasksRepository tasksRepository;

  GetTaskByIdUseCase({required this.tasksRepository});

  Future<Either<Failure, Task>> call(int id) async {
    return await tasksRepository.getTaskById(id);
  }
}
