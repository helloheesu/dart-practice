String formatMinutes(int minutes) {
  if (minutes < 60) return '${minutes}분';
  final hours = minutes ~/ 60;
  final remain = minutes % 60;
  if (remain == 0) return '${hours}시간';
  return '${hours}시간 ${remain}분';
}
