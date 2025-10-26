import 'package:flutter/material.dart';
import 'package:tasks/models/task_entity.dart';
import 'package:tasks/widgets/add_task_bottomsheet.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  _handleTaskSubmitted(BuildContext context, TaskEntity task) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '추가됨: ${task.title}, ${task.isFavorite ? '즐겨찾기' : '즐겨찾기 아님'}, 세부사항: ${task.description ?? '없음'}',
        ),
      ),
    );
  }

  _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => AddTaskBottomSheet(
        onSubmitted: (task) {
          _handleTaskSubmitted(context, task);
        },
      ),
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
