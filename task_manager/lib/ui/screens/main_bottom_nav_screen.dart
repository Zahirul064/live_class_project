import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/main_bottom_nav_controller.dart';
import 'package:task_manager/ui/screens/progress_task_list_screen.dart';
import 'cancel_task_list_screen.dart';
import 'complete_task_list_screen.dart';
import 'new_task_list_screen.dart';


class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  static const String name = '/home';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavController _mainBottomNavController = Get.find<MainBottomNavController>();

  final List<Widget> _screens = const [
    NewTaskListScreen(),
    ProgressTaskListScreen(),
    CompleteTaskListScreen(),
    CancelTaskListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[_mainBottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(




              selectedIndex: _mainBottomNavController.selectedIndex,
              onDestinationSelected: (int index) {
                _mainBottomNavController.setIndex(index);
                print(_mainBottomNavController.selectedIndex);
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.new_label_outlined), label: 'New'),
                NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
                NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
                NavigationDestination(
                    icon: Icon(Icons.cancel_outlined), label: 'Cancelled'),
              ]),
        );
      }
    );
  }
}
