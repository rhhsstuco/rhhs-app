import 'package:flutter/material.dart';
import 'package:rhhs_app/types/announcement.dart';

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCard({
    super.key,
    required this.announcement,
  });

  void _onClick(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog.adaptive(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: AnnouncementHeader(
          text: announcement.author,
          color: announcement.type.color,
        ),
        content: SingleChildScrollView(
          child: Text(
            announcement.content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Dismiss"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnnouncementHeader(
              text: announcement.author,
              color: announcement.type.color,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              announcement.content.trim(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () => _onClick(context),
              child: const Text("Read more"),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementHeader extends StatelessWidget {
  final String text;
  final Color color;

  const AnnouncementHeader({super.key, required this.text, required this.color, });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
        ),
      ),
    );
  }
}