import 'package:flutter/material.dart';
import 'package:rhhs_app/types/school_club.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubCard extends StatefulWidget {
  final SchoolClub club;

  const ClubCard({
    required this.club,
    super.key,
  });

  @override
  State<ClubCard> createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  bool _canNotify = false;

  @override
  void initState() {
    super.initState();

    initializeCanNotify();
  }

  void initializeCanNotify() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String>? whitelist = prefs.getStringList(SchoolClub.clubWhitelistKey);

    setState(() {
      _canNotify = whitelist?.contains(widget.club.name) ?? false;
    });
  }

  void onPress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> whitelist = prefs.getStringList(SchoolClub.clubWhitelistKey) ?? [];
    final clubName = widget.club.name;

    if (whitelist.contains(clubName)) {
      whitelist.remove(clubName);

      setState(() {
        _canNotify = false;
      });

    } else {
      whitelist.add(clubName);

      setState(() {
        _canNotify = true;
      });
    }

    prefs.setStringList(SchoolClub.clubWhitelistKey, whitelist);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.club.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      widget.club.room,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      widget.club.meetingTime,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              height: 90.0,
              child: Container(
                color: widget.club.bannerColor,
              ),
            ),
            Positioned(
              top: 12.0,
              left: 15.0,
              height: 90.0,
              width: 90.0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      )
                    ]),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipOval(
                      child: Image.asset(
                        widget.club.imagePath,
                        semanticLabel: '${widget.club.name} Logo',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              right: 0,
              child: IconButton(
                onPressed: onPress,
                icon: Icon(
                  _canNotify
                      ? Icons.notifications
                      : Icons.notifications_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
