import 'package:flutter/material.dart';
import 'package:tasks/models/task_entity.dart';

class MinimalIconButton extends StatelessWidget {
  const MinimalIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}

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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Row(
        spacing: 12,
        children: [
          MinimalIconButton(
            onPressed: onToggleDone,
            icon: task.isDone ? Icons.check_circle : Icons.circle_outlined,
          ),
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
          MinimalIconButton(
            onPressed: onToggleFavorite,
            icon: task.isFavorite ? Icons.star : Icons.star_border,
          ),
        ],
      ),
    );
  }
}
