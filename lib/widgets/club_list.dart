import 'package:flutter/material.dart';
import 'package:rhhs_app/types/school_club.dart';
import 'package:rhhs_app/widgets/club_card.dart';

class ClubList extends StatelessWidget {
  final List<SchoolClub> clubs;

  const ClubList({
    required this.clubs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        final SchoolClub currentClub = clubs.elementAt(index);

        return ClubCard(
          club: currentClub,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: double.infinity,
          height: 15,
        );
      },
    );
  }
}
