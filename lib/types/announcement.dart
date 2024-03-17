class Announcement {
  final String content;
  final String author;
  final AnnouncementType type;

  const Announcement({
    required this.content,
    required this.author,
    required this.type,
  });
}

enum AnnouncementType {
  admin,
  club,
  guidance,
}
