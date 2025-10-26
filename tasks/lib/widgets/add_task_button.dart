import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: TextField(
          controller: TextEditingController(),
          autofocus: true,
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(hintText: '새 할 일'),
        ),
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
