import 'package:flutter/material.dart';
import 'package:rhhs_app/types/school_club.dart';

class ClubCard extends StatelessWidget {
  final SchoolClub club;

  const ClubCard({
    required this.club,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              right: 0,
              height: 80.0,
              child: Container(
                color: club.bannerColor,
              ),
            ),
            Positioned(
              top: 20.0,
              left: 30.0,
              height: 100.0,
              width: 100.0,
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipOval(
                    child: Image.asset(
                      club.imagePath,
                      semanticLabel: '${club.name} Logo',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
