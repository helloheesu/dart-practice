import 'package:flutter/material.dart';
import 'package:tasks/models/task_entity.dart';

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TaskEntity _task = const TaskEntity(title: '');

  final TextEditingController _titleController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();

  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _descriptionFocusNode = FocusNode();
  bool _showDescription = false;

  @override
  void dispose() {
    _titleController.dispose();
    _titleFocusNode.dispose();
    _descriptionController.dispose();
    _descriptionFocusNode.dispose();
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
                _task = _task.copyWith(title: t);
              });
            },
            onSubmitted: (_) => _submit(),
            onEditingComplete: () {
              if (_task.title.isEmpty) {
                _titleFocusNode.requestFocus();
              }
            },
          ),
          if (_showDescription)
            TextField(
              controller: _descriptionController,
              focusNode: _descriptionFocusNode,
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                hintText: '세부정보 추가',
                border: InputBorder.none,
              ),
              onChanged: (s) {
                setState(() {
                  _task = _task.copyWith(description: s);
                });
              },
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (!_showDescription)
                    IconButton(
                      icon: const Icon(Icons.short_text_rounded, size: 24),
                      onPressed: () {
                        setState(() {
                          _showDescription = true;
                        });
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (!mounted) return;
                          _descriptionFocusNode.requestFocus();
                        });
                      },
                    ),
                  IconButton(
                    icon: Icon(
                      _task.isFavorite ? Icons.star : Icons.star_border,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        _task = _task.copyWith(isFavorite: !_task.isFavorite);
                      });
                    },
                  ),
                ],
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
