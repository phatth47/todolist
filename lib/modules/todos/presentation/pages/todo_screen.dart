import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/modules/todos/data/models/todo_model.dart';
import 'package:todolist/modules/todos/presentation/blocs/todo/todo_bloc.dart';
import 'package:todolist/modules/todos/presentation/pages/widgets/todo_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TodoBloc _todoBloc;

  @override
  void initState() {
    _todoBloc = TodoBloc();
    _todoBloc.add(GetTodoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _todoBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todos"),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onAdd,
          child: const Text("Add"),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TodoEmpty) {
              return const Center(
                child: Text("Empty"),
              );
            }

            if (state is TodoError) {
              final errorMsg = state.error;
              return Center(
                child: Text(errorMsg),
              );
            }

            if (state is TodoData) {
              final todoList = state.todoResponse.todoList ?? [];
              final todoTotal = state.todoResponse.total ?? 0;

              return ListView.separated(
                itemCount: todoTotal,
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (context, index) {
                  final todo = todoList[index];

                  return TodoWidget(todo: todo);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _onAdd() {
    /// Sample todo
    final currentState = _todoBloc.state as TodoData;
    final idTodo = (currentState.todoResponse.total ?? 0) + 1;
    final TodoModel todoModelAdd = TodoModel(
      id: idTodo,
      title: 'Todo Added $idTodo',
      description: 'Description for Todo Added $idTodo',
      type: 'study',
    );
    _todoBloc.add(AddTodoEvent(todoModelAdd));
  }
}
