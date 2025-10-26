import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/empty_tasks_placeholder.dart';
import '../widgets/add_task_button.dart';
import '../models/task_entity.dart';
import '../widgets/task_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TaskEntity> _tasks = <TaskEntity>[];

  void _addTask(TaskEntity task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _toggleDone(int index) {
    setState(() {
      final TaskEntity t = _tasks[index];
      _tasks[index] = t.copyWith(isDone: !t.isDone);
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      final TaskEntity t = _tasks[index];
      _tasks[index] = t.copyWith(isFavorite: !t.isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: _tasks.isEmpty
          ? const EmptyTasksPlaceholder()
          : SafeArea(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final TaskEntity task = _tasks[index];
                  return TaskView(
                    task: task,
                    onToggleDone: () => _toggleDone(index),
                    onToggleFavorite: () => _toggleFavorite(index),
                  );
                },
              ),
            ),
      floatingActionButton: AddTaskButton(onSubmitted: _addTask),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomInset: false,
    );
  }
}
