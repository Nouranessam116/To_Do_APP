class Tasks {
  String title;
  String description;
  DateTime date;
  bool is_done;

  Tasks({
    required this.title,
    required this.description,
    DateTime? date,
    this.is_done = false,
  }) : date = date ?? DateTime.now();
}