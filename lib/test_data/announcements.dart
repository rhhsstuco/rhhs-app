import 'package:rhhs_app/types/announcement.dart';

const announcementList = <Announcement>[
  Announcement(
    author: "Computer Science Club",
    content: "Hey Robots! Come visit for a Lorem ipsum dolor sit amet,consectetur adipiscing elit. Sed id ornare augue, consectetur euismod felis. Pellentesque pulvinar non mauris eget.",
    type: AnnouncementType.club,
  ),
  Announcement(
    author: "Guidance",
    content: "Hey students! Make sure to complete your course selection by today.",
    type: AnnouncementType.guidance,
  ),
  Announcement(
    author: "Admin",
    content: "Hey Robots! Come visit for a Lorem ipsum dolor sit amet,consectetur adipiscing elit. Sed id ornare augue, consectetur euismod felis. Pellentesque pulvinar non mauris eget.",
    type: AnnouncementType.admin,
  ),
];
