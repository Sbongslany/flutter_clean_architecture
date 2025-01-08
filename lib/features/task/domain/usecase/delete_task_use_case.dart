import 'package:provider_clean/core/model/failure.dart';
import 'package:provider_clean/features/task/domain/repository/tasks_repository.dart';

import '../../../../core/model/either.dart';

class DeleteTaskUseCase {
  final TasksRepository tasksRepository;

  DeleteTaskUseCase({required this.tasksRepository});

  Future<Either<Failure, void>> call(int id) async {
    return await tasksRepository.deleteTask(id);
  }
}
