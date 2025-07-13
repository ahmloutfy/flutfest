class EventModel {
  final int id;
  final String? title, date, description, location, image;
  bool isUpcomingForDemo;

  EventModel({
    this.isUpcomingForDemo = false,
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.image,
    required this.description,
  });
}
