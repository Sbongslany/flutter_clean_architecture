import 'package:flutter/cupertino.dart';
import 'package:provider_clean/features/task/domain/entity/task.dart';
import 'package:provider_clean/features/task/domain/usecase/get_task_by_id_use_case.dart';

enum SingleTaskStatus { initial, loading, success, error }

class SingleTaskProvider extends ChangeNotifier {
  final GetTaskByIdUseCase getTaskByIdUseCase;

  SingleTaskProvider({required this.getTaskByIdUseCase});

  SingleTaskStatus status = SingleTaskStatus.initial;
  String errorMessage = '';

  Task? task;

  void getTaskById(int id) async {
    status = SingleTaskStatus.loading;
    notifyListeners();

    var result = await getTaskByIdUseCase(id);

    result.fold((l) {
      status = SingleTaskStatus.error;
      errorMessage = l.errorMessage;
      task = null;
      notifyListeners();
    }, (r) {
      status = SingleTaskStatus.success;
      errorMessage = '';
      task = r;
      notifyListeners();
    });
  }
}
