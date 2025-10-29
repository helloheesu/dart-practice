enum ProductCategory {
  takeFive(code: 'take-five', label: '5분만 쉴까', emoji: '📱', order: 1),
  newExploration(
    code: 'new-exploration',
    label: '새로운 탐험',
    emoji: '🌟',
    order: 2,
  ),
  betterTomorrow(
    code: 'better-tomorrow',
    label: '더 나은 내일',
    emoji: '🎯',
    order: 3,
  ),
  meTime(code: 'me-time', label: '나를 위한 시간', emoji: '🏠', order: 4);

  const ProductCategory({
    required this.code,
    required this.label,
    required this.emoji,
    required this.order,
  });
  final String code;
  final String label;
  final String emoji;
  final int order;

  static ProductCategory? fromCodeOrNull(String code) {
    for (final c in ProductCategory.values) {
      if (c.code == code) return c;
    }
    return null;
  }
}
