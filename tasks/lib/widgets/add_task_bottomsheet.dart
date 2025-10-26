import 'package:flutter/material.dart';
import 'package:tasks/models/task_entity.dart';

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _submit(String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return;

    final task = TaskEntity(title: trimmed);
    widget.onSubmitted(task);

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
      child: TextField(
        controller: _titleController,
        autofocus: true,
        style: const TextStyle(fontSize: 16),
        decoration: const InputDecoration(hintText: '새 할 일'),
        onSubmitted: _submit,
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
