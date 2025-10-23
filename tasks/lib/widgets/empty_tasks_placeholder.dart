import 'package:flutter/material.dart';

class EmptyTasksPlaceholder extends StatelessWidget {
  const EmptyTasksPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // theme
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          // 이미지 변경 예정 - 100x100, webp
          Icon(Icons.task, size: 50, color: Colors.yellow),

          const Text(
            '아직 할 일이 없음',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          // 타이틀 받아서 사용하도록 변경
          Text(
            '할 일을 추가하고 희수`s Tasks에서\n할 일을 추적하세요.',
            style: TextStyle(fontSize: 14, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
