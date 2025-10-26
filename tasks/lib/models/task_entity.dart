class TaskEntity {
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;

  const TaskEntity({
    required this.title,
    this.description,
    this.isFavorite = false,
    this.isDone = false,
  });
}
