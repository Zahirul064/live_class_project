import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/canceled_task_list_screen.dart';
import 'package:task_manager/ui/screens/completed_task_list_screen.dart';
import 'package:task_manager/ui/screens/new_task_list_screen.dart';
import 'package:task_manager/ui/screens/progress_task_list_screen.dart';
import 'package:task_manager/ui/utils/status_enum.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/home';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskListScreen(),
    ProgressTaskListScreen(),
    CompletedTaskListScreen(),
    CanceledTaskListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.new_label_outlined), label: enumTaskStatus.NewTask.name),
          NavigationDestination(icon: const Icon(Icons.refresh), label: enumTaskStatus.Progress.name),
          NavigationDestination(icon: const Icon(Icons.done), label:enumTaskStatus.Completed.name),
          NavigationDestination(
              icon: const Icon(Icons.cancel_outlined), label: enumTaskStatus.Canceled.name),
        ],
      ),
    );
  }
}
