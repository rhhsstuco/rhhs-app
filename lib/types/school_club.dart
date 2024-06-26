import 'package:flutter/material.dart';

class SchoolClub {
  static const clubWhitelistKey = "clubs_whitelist";

  final String name;
  final String room;
  final String meetingTime;
  final Color bannerColor;
  final String imagePath;
  final String? instagram;

  const SchoolClub({
    required this.name,
    required this.room,
    required this.meetingTime,
    required this.bannerColor,
    required this.imagePath,
    this.instagram,
  });
}
