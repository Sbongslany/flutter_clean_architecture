import 'package:provider_clean/core/model/failure.dart';
import 'package:provider_clean/features/task/domain/repository/tasks_repository.dart';

import '../../../../core/model/either.dart';
import '../entity/task.dart';

class GetTasksUseCase {
  final TasksRepository tasksRepository;

  GetTasksUseCase({required this.tasksRepository});

  Future<Either<Failure, List<Task>>> call() async {
    return await tasksRepository.getTasks();
  }
}
