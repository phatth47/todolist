import 'package:todolist/modules/todos/data/models/todo_model.dart';

class TodoListingModel {
  List<TodoModel>? todoList;
  int? total;

  TodoListingModel({
    this.todoList,
    this.total,
  });

  TodoListingModel copyWith({
    List<TodoModel>? todoList,
    int? total,
  }) {
    return TodoListingModel(
      todoList: todoList ?? this.todoList,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todos': todoList,
      'total': total,
    };
  }

  factory TodoListingModel.fromJson(Map<String, dynamic> json) {
    return TodoListingModel(
      todoList: (json['todos'] as List<dynamic>?)
          ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );
  }
}
