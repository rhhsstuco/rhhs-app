import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rhhs_app/test_data/announcements.dart';
import 'package:rhhs_app/types/announcement.dart';
import 'package:rhhs_app/widgets/announcement_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../types/school_club.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Announcement>? _announcements;

  @override
  void initState() {
    super.initState();

    initializeAnnouncements();
  }

  void initializeAnnouncements() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> clubWhitelist =
        prefs.getStringList(SchoolClub.clubWhitelistKey) ?? [];

    final Set<String> clubSet = clubWhitelist.toSet();

    setState(() {
      _announcements = announcementList.where((club) {
        if (club.type == AnnouncementType.club) {
          return clubSet.contains(club.author);
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _announcements == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return AnnouncementCard(
                  announcement: _announcements!.elementAt(index),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: _announcements!.length,
            ),
    );
  }
}

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  static final DateFormat formatter = DateFormat.MMMMd();

  @override
  Widget build(BuildContext context) {
    return const Text("Announcements");
  }
}
