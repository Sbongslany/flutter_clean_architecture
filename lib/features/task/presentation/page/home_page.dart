import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean/features/task/presentation/provider/tasks_provider.dart';
import 'package:provider_clean/features/task/presentation/widget/create_task.dart';
import 'package:provider_clean/features/task/presentation/widget/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TasksProvider>(
        builder: (context, provider, widget) {
          if (provider.status == TasksStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (provider.status == TasksStatus.error) {
            return Text(provider.errorMessage);
          }
          if (provider.status == TasksStatus.success) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return TaskWidget(task: provider.tasks[index]);
              },
              itemCount: provider.tasks.length,
            );
          }
          return const Center(child: Text(''));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const CreateTaskDialog();
              });
        },
      ),
    );
  }
}
