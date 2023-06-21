import 'package:flutter/material.dart';
import 'package:todolist/modules/category/presentation/pages/category_screen.dart';
import 'package:todolist/modules/profile/presentation/profile_screen.dart';
import 'package:todolist/modules/todos/presentation/pages/todo_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0; //New

  List<Widget> pages = const [
    TodoScreen(),
    CategoryScreen(),
    ProfileScreen(title: "ABCCCCC",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onChangeItem,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }

  void onChangeItem(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
