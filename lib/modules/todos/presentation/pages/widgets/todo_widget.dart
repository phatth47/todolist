import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/infrastructure/config/color_config.dart';
import 'package:todolist/modules/todos/data/models/todo_model.dart';
import 'package:todolist/modules/todos/presentation/blocs/todo/todo_bloc.dart';

class TodoWidget extends StatefulWidget {
  final TodoModel todo;

  const TodoWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    final title = widget.todo.title ?? "";
    final description = widget.todo.description ?? "";
    final colorType = widget.todo.getColorTodoType;
    final todoDone = widget.todo.isDone ?? false;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colorType,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (todoDone) ...[
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.check_circle_outline,
                      size: 18,
                      color: ColorConfig.doneColor,
                    ),
                  ],
                ],
              ),
              GestureDetector(
                onTap: showOptions,
                child: const Icon(
                  Icons.edit,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }

  void showOptions() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          color: ColorConfig.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _onDone,
                child: Row(
                  children: const [
                    Icon(
                      Icons.check,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text("Mark Done"),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _onDelete,
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete,
                      size: 16,
                      color: ColorConfig.redColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Delete",
                      style: TextStyle(
                        color: ColorConfig.redColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onDone() {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    todoBloc.add(MarkDoneTodoEvent(widget.todo));
    Navigator.of(context).pop();
  }

  void _onDelete() {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    todoBloc.add(DeleteTodoEvent(widget.todo));
    Navigator.of(context).pop();
  }
}
