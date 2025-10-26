import 'package:flutter/material.dart';
import 'package:tasks/models/task_entity.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
    required this.task,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  final TaskEntity task;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 24,
            onPressed: onToggleDone,
            icon: Icon(
              task.isDone ? Icons.check_circle : Icons.circle_outlined,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              task.title,
              style: TextStyle(
                fontSize: 16,
                decoration: task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            iconSize: 24,
            onPressed: onToggleFavorite,
            icon: Icon(task.isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
      ),
    );
  }
}
