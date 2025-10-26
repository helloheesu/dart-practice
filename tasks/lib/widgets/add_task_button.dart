import 'package:flutter/material.dart';
import 'package:tasks/models/task_entity.dart';
import 'package:tasks/widgets/add_task_bottomsheet.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.onSubmitted});

  final ValueChanged<TaskEntity> onSubmitted;

  _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) =>
          SafeArea(child: AddTaskBottomSheet(onSubmitted: onSubmitted)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddTaskBottomSheet(context),
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
