import 'package:flutter/material.dart';
import 'package:rhhs_app/test_data/clubs.dart';
import 'package:rhhs_app/widgets/club_list.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                controller: controller,
                shape: MaterialStatePropertyAll<OutlinedBorder>(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder: (context, controller) {
              return List<ListTile>.generate(5, (index) {
                final String item = 'Item $index';

                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
        ),
        Expanded(
          child: ClubList(clubs: clubList),
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
