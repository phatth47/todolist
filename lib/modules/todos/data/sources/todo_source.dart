import 'package:todolist/modules/todos/data/models/todo_listing_model.dart';
import 'package:todolist/modules/todos/data/models/todo_model.dart';
import 'package:todolist/modules/todos/data/sources/todo_raw.dart';

class TodoSource {
  Future<TodoListingModel> getTodos() async {
    await Future.delayed(const Duration(seconds: 2)); // Hard waiting
    final json = todoRaw; // Hard data
    return TodoListingModel.fromJson(json);
  }
}
