import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean/features/task/domain/entity/task.dart';
import 'package:provider_clean/features/task/presentation/provider/tasks_provider.dart';

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Task'),
      content: Column(
        children: [
          TextField(
            controller: title,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: description,
            decoration: const InputDecoration(hintText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok')),
        ElevatedButton(
            onPressed: () {
              context.read<TasksProvider>().createTask(Task(
                  title: title.text,
                  description: description.text,
                  isCompleted: false,
                  createdAt: DateTime.now()));
            },
            child: const Text('Create'))
      ],
    );
  }
}
