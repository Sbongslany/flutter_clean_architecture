import 'package:provider_clean/core/model/either.dart';
import 'package:provider_clean/core/model/failure.dart';
import 'package:provider_clean/features/task/data/datasources/local_tasks_datasource.dart';
import 'package:provider_clean/features/task/domain/entity/task.dart';
import 'package:provider_clean/features/task/domain/repository/tasks_repository.dart';

import '../model/task_model.dart';

class TasksRepositoryImpl extends TasksRepository {
  final LocalTasksDatasource localTasksDatasource;

  TasksRepositoryImpl({required this.localTasksDatasource});

  @override
  Future<Either<Failure, void>> createTask(Task task) async {
    try {
      await localTasksDatasource.createTask(TaskModel.fromEntity(task));
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Create Task Failure'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id) async {
    try {
      await localTasksDatasource.deleteTask(id);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Delete Task Failure'));
    }
  }

  @override
  Future<Either<Failure, Task>> getTaskById(int id) async {
    try {
      return Right(await localTasksDatasource.getTaskById(id));
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Get Task Failure'));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      return Right(await localTasksDatasource.getTasks());
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Get Tasks Failure'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(Task task) async {
    try {
      await localTasksDatasource.updateTask(TaskModel.fromEntity(task));
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: 'Update Task Failure'));
    }
  }
}
