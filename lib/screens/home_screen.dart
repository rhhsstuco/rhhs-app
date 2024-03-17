import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rhhs_app/test_data/annoucements.dart';
import 'package:rhhs_app/widgets/announcement_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return AnnouncementCard(
            announcement: announcementList.elementAt(index));
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12,
        );
      },
      itemCount: announcementList.length,
    );
  }
}

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  static final DateFormat formatter = DateFormat.MMMMd();

  @override
  Widget build(BuildContext context) {
    return Text(formatter.format(DateTime.now()));
  }
}
