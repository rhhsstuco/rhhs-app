import 'package:flutter/material.dart';

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
  admin(color: Colors.deepOrange),
  club(color: Colors.lightBlue),
  guidance(color: Colors.teal);

  final Color color;

  const AnnouncementType({
    required this.color,
  });
}
