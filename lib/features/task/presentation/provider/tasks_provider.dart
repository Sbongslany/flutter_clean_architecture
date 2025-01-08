import 'package:flutter/cupertino.dart';
import 'package:provider_clean/features/task/domain/usecase/create_task_use_case.dart';
import 'package:provider_clean/features/task/domain/usecase/delete_task_use_case.dart';
import 'package:provider_clean/features/task/domain/usecase/get_tasks_use_case.dart';
import 'package:provider_clean/features/task/domain/usecase/update_task_use_case.dart';

import '../../domain/entity/task.dart';

enum TasksStatus { initial, loading, success, error }

class TasksProvider with ChangeNotifier {
  final GetTasksUseCase getTasksUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final CreateTaskUseCase createTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  TasksProvider(
      {required this.getTasksUseCase,
      required this.deleteTaskUseCase,
      required this.createTaskUseCase,
      required this.updateTaskUseCase});

  TasksStatus status = TasksStatus.initial;
  String errorMessage = '';
  List<Task> tasks = [];

  void getTasks() async {
    status = TasksStatus.loading;
    notifyListeners();

    var result = await getTasksUseCase();

    result.fold((l) {
      status = TasksStatus.error;
      errorMessage = l.errorMessage;
      tasks = [];
      notifyListeners();
    }, (r) {
      status = TasksStatus.success;
      errorMessage = '';
      tasks = r;
      notifyListeners();
    });
  }

  void updateTasks(Task task) async {
    status = TasksStatus.loading;
    notifyListeners();

    var result = await updateTaskUseCase(task);

    result.fold((l) {
      status = TasksStatus.error;
      errorMessage = l.errorMessage;
      tasks = [];
      notifyListeners();
    }, (r) {
      status = TasksStatus.success;
      errorMessage = '';
      notifyListeners();
      getTasks();
    });
  }

  void deleteTask(int id) async {
    status = TasksStatus.loading;
    notifyListeners();

    var result = await deleteTaskUseCase(id);

    result.fold((l) {
      status = TasksStatus.error;
      errorMessage = l.errorMessage;
      tasks = [];
      notifyListeners();
    }, (r) {
      status = TasksStatus.success;
      errorMessage = '';
      notifyListeners();
      getTasks();
    });
  }

  void createTask(Task task) async {
    status = TasksStatus.loading;
    notifyListeners();

    var result = await createTaskUseCase(task);

    result.fold((l) {
      status = TasksStatus.error;
      errorMessage = l.errorMessage;
      tasks = [];
      notifyListeners();
    }, (r) {
      status = TasksStatus.success;
      errorMessage = '';
      notifyListeners();
      getTasks();
    });
  }
}
