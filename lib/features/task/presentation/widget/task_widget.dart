import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean/features/task/presentation/provider/tasks_provider.dart';

import '../../domain/entity/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          context
              .read<TasksProvider>()
              .updateTasks(task.copyWith(isCompleted: value));
        },
      ),
    );
  }
}
