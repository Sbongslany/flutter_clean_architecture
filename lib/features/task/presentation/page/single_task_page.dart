import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean/core/di/get_it.dart';
import 'package:provider_clean/features/task/presentation/provider/single_task_provider.dart';

class SingleTaskPage extends StatelessWidget {
  final int id;
  const SingleTaskPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Scaffold(
        body: Consumer<SingleTaskProvider>(
          builder: (context, provider, widget) {
            if (provider.status == SingleTaskStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (provider.status == SingleTaskStatus.error) {
              return Center(
                child: Text(provider.errorMessage),
              );
            }
            if (provider.status == SingleTaskStatus.success) {
              return Column(
                children: [
                  Text(provider.task!.title),
                  Text(provider.task!.description),
                  Text(provider.task!.createdAt.toString())
                ],
              );
            }
            return const Center(child: Text(''));
          },
        ),
      ),
      create: (BuildContext context) =>
          getIt<SingleTaskProvider>()..getTaskById(id),
    );
  }
}
