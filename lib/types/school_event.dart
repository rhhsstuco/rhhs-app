class SchoolEvent {
  final DateTime startDate;
  final DateTime? endDate;
  final String name;
  final String description;

  const SchoolEvent({
    required this.startDate,
    required this.name,
    required this.description,
    this.endDate,
  });
}
