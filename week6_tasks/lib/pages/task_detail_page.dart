import 'package:flutter/material.dart';
import '../models/task_entity.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({
    super.key,
    required this.task,
    required this.onToggleFavorite,
  });

  final TaskEntity task;
  final VoidCallback onToggleFavorite;

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late TaskEntity _task;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
  }

  void _toggleFavorite() {
    setState(() {
      _task = _task.copyWith(isFavorite: !_task.isFavorite);
    });
    widget.onToggleFavorite();
  }

  @override
  Widget build(BuildContext context) {
    final Color containerColor = Theme.of(
      context,
    ).colorScheme.surfaceContainerHighest;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: Icon(_task.isFavorite ? Icons.star : Icons.star_border),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                _task.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if ((_task.description ?? '').isNotEmpty) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(Icons.short_text_rounded, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _task.description!,
                        style: const TextStyle(fontSize: 14, height: 1.6),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
