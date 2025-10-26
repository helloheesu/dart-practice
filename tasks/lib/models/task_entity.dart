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

  TaskEntity copyWith({
    String? title,
    String? description,
    bool? isFavorite,
    bool? isDone,
  }) {
    return TaskEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      isDone: isDone ?? this.isDone,
    );
  }
}
