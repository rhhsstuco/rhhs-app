import 'package:flutter/material.dart';
import 'package:rhhs_app/types/school_club.dart';

const clubList = <SchoolClub>[
  SchoolClub(
    name: 'Computer Science Club',
    room: 'Library',
    meetingTime: 'Weekly Meetings Thursdays',
    bannerColor: Colors.black,
    imagePath: "assets/images/club_logos/CS_Club_Logo.jpg",
    instagram: 'https://www.instagram.com/rhhs.cs.club/',
  ),
  SchoolClub(
    name: 'Math Club',
    room: 'Room 2027',
    meetingTime: 'Weekly Meetings Fridays',
    bannerColor: Color.fromRGBO(25, 144, 104, 1.0),
    imagePath: "assets/images/club_logos/Math_Logo.jpg",
    instagram: 'https://www.instagram.com/rhhs_math/',
  ),
  SchoolClub(
    name: 'Art Council',
    room: 'Room 2004',
    meetingTime: 'Weekly Meetings Wednesdays',
    bannerColor: Color.fromRGBO(189, 206, 222, 1.0),
    imagePath: "assets/images/club_logos/Art_Council_Logo.jpg",
    instagram: 'https://www.instagram.com/rhhs_artco/',
  ),
  SchoolClub(
    name: 'Neuroscience ',
    room: 'Room 2024',
    meetingTime: 'Weekly Meetings Tuesdays',
    bannerColor: Color.fromRGBO(182, 178, 176, 1.0),
    imagePath: "assets/images/club_logos/Neuroscience_Logo.jpg",
    instagram: 'https://www.instagram.com/rhhs.neuroscience/',
  ),
];

final clubNameList = clubList.toList().map((club) => club.name).toList();
