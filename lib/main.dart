import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean/core/di/get_it.dart';
import 'package:provider_clean/features/task/presentation/page/home_page.dart';
import 'package:provider_clean/features/task/presentation/provider/tasks_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(ChangeNotifierProvider(
    child: const MaterialApp(
      home: HomePage(),
    ),
    create: (context) => getIt<TasksProvider>()..getTasks(),
  ));
}
