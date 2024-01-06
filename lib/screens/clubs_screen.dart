import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rhhs_app/test_data/clubs.dart';
import 'package:rhhs_app/widgets/club_list.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  String? _searchText;

  Widget Function(String) tileMapper(SearchController controller) {
    return (clubName) => ListTile(
          title: Text(clubName),
          onTap: () {
            setState(() {
              controller.closeView(clubName);
            });
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final filteredClubList = clubList.where((club) {
      // Don't apply filter
      if ((_searchText == null) || (_searchText!.isEmpty)) {
        return true;
      }

      // Apply filter
      final searchTextLowercase = _searchText!.toLowerCase();

      return club.name.toLowerCase().contains(searchTextLowercase) ||
          club.room.toLowerCase().contains(searchTextLowercase) ||
          club.meetingTime.toLowerCase().contains(searchTextLowercase);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                shape: MaterialStatePropertyAll<OutlinedBorder>(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                onChanged: (text) {
                  setState(() {
                    _searchText = text;
                  });
                },
                onSubmitted: (text) {
                  setState(() {
                    _searchText = text;
                  });
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder: (context, controller) {
              // If no filter, suggest clubs
              if (filteredClubList.length == clubList.length) {
                return clubNameList
                    .getRange(0, min(clubNameList.length, 5))
                    .map(tileMapper(controller));
              }

              return filteredClubList
                  .getRange(0, min(filteredClubList.length, 5))
                  .map((club) => club.name)
                  .map(tileMapper(controller));
            },
          ),
        ),
        Expanded(
          child: ClubList(clubs: filteredClubList),
        ),
      ],
    );
  }
}

class ClubsScreenAppBar extends StatelessWidget {
  const ClubsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Clubs");
  }
}
