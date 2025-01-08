import 'package:provider_clean/features/task/data/model/task_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalTasksDatasource {
  final Database database;

  LocalTasksDatasource({required this.database});

  Future<List<TaskModel>> getTasks() async {
    var result = await database.query('tasks');
    return result.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future createTask(TaskModel taskModel) async {
    await database.insert('tasks', taskModel.toJson());
  }

  Future updateTask(TaskModel taskModel) async {
    await database.update('tasks', taskModel.toJson(),
        where: 'id = ?', whereArgs: [taskModel.id]);
  }

  Future deleteTask(int id) async {
    await database.delete('tasks', where: 'id = ? ', whereArgs: [id]);
  }

  Future<TaskModel> getTaskById(int id) async {
    var result =
        await database.query('tasks', where: 'id = ?', whereArgs: [id]);
    return TaskModel.fromJson(result.first);
  }
}
