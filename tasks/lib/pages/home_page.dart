import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/empty_tasks_placeholder.dart';
import '../widgets/add_task_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SizedBox.expand(child: const EmptyTasksPlaceholder()),
      floatingActionButton: AddTaskButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomInset: false,
    );
  }
}
