import 'dart:io';

void saveStringToFile({required String filePath, required String content}) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print('저장이 완료되었습니다.');
  } catch (e) {
    print('저장에 실패했습니다: $e');
  }
}
