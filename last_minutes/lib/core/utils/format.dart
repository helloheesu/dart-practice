String formatMinutes(int minutes) {
  if (minutes < 60) return '${minutes}분';
  final hours = minutes ~/ 60;
  final remain = minutes % 60;
  if (remain == 0) return '${hours}시간';
  return '${hours}시간 ${remain}분';
}

/// Shorter representation for badges: `N분` or `N.M시간`
String formatMinutesShort(int minutes) {
  if (minutes <= 0) return '0분';
  if (minutes < 60) return '${minutes}분';
  final hour = minutes / 60.0;
  final hasDecimal = minutes % 60 != 0;
  final text = hasDecimal ? hour.toStringAsFixed(1) : hour.toStringAsFixed(0);
  return '${text}시간';
}
