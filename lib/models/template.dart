class Template {
  Template({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    this.color = 0xFFEA6B2E,
  });

  final String id;
  final String title;
  final String category;
  final String description;
  final int color;
}
