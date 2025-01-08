import 'package:get_it/get_it.dart';
import 'package:provider_clean/core/database/app_database.dart';
import 'package:provider_clean/features/task/data/datasources/local_tasks_datasource.dart';
import 'package:provider_clean/features/task/data/repository/tasks_repository_impl.dart';
import 'package:provider_clean/features/task/domain/repository/tasks_repository.dart';
import 'package:provider_clean/features/task/domain/usecase/create_task_use_case.dart';
import 'package:provider_clean/features/task/domain/usecase/delete_task_use_case.dart';
import 'package:provider_clean/features/task/domain/usecase/get_task_by_id_use_case.dart';
import 'package:provider_clean/features/task/domain/usecase/get_tasks_use_case.dart';
import 'package:provider_clean/features/task/domain/usecase/update_task_use_case.dart';
import 'package:provider_clean/features/task/presentation/provider/single_task_provider.dart';
import 'package:provider_clean/features/task/presentation/provider/tasks_provider.dart';

var getIt = GetIt.instance;

Future setup() async {
  await registerDatabase();
  registerDataSources();
  registerRepositories();
  registerUseCases();
  registerProviders();
}

Future registerDatabase() async {
  getIt.registerSingleton(await AppDatabase.database);
}

void registerDataSources() async {
  getIt.registerSingleton(LocalTasksDatasource(database: getIt()));
}

void registerRepositories() async {
  getIt.registerSingleton<TasksRepository>(
      TasksRepositoryImpl(localTasksDatasource: getIt()));
}

void registerUseCases() async {
  getIt.registerSingleton(GetTasksUseCase(tasksRepository: getIt()));
  getIt.registerSingleton(GetTaskByIdUseCase(tasksRepository: getIt()));
  getIt.registerSingleton(DeleteTaskUseCase(tasksRepository: getIt()));
  getIt.registerSingleton(CreateTaskUseCase(tasksRepository: getIt()));
  getIt.registerSingleton(UpdateTaskUseCase(tasksRepository: getIt()));
}

void registerProviders() async {
  getIt.registerSingleton(TasksProvider(
      getTasksUseCase: getIt(),
      deleteTaskUseCase: getIt(),
      createTaskUseCase: getIt(),
      updateTaskUseCase: getIt()));
  getIt.registerSingleton(SingleTaskProvider(getTaskByIdUseCase: getIt()));
}
