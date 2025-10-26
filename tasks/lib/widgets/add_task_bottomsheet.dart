import 'package:flutter/material.dart';
import 'package:tasks/models/task_entity.dart';

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  TaskEntity _task = const TaskEntity(title: '');

  @override
  void dispose() {
    _titleController.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    if (_task.title.isEmpty) return;

    widget.onSubmitted(_task);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          TextField(
            controller: _titleController,
            focusNode: _titleFocusNode,
            autofocus: true,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              hintText: '새 할 일',
              border: InputBorder.none,
            ),
            onChanged: (s) {
              final t = s.trim();
              if (t == _task.title) return;

              setState(() {
                _task = TaskEntity(
                  title: t,
                  description: _task.description,
                  isFavorite: _task.isFavorite,
                  isDone: _task.isDone,
                );
              });
            },
            onSubmitted: (_) => _submit(),
            onEditingComplete: () {
              if (_task.title.isEmpty) {
                _titleFocusNode.requestFocus();
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  _task.isFavorite ? Icons.star : Icons.star_border,
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    _task = TaskEntity(
                      title: _task.title,
                      description: _task.description,
                      isFavorite: !_task.isFavorite,
                      isDone: _task.isDone,
                    );
                  });
                },
              ),
              TextButton(
                onPressed: _task.title.isNotEmpty ? _submit : null,
                child: Text('저장'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddTaskBottomSheet extends StatefulWidget {
  final ValueChanged<TaskEntity> onSubmitted;
  const AddTaskBottomSheet({super.key, required this.onSubmitted});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}
