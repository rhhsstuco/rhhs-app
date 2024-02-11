import 'package:flutter/material.dart';
import 'package:rhhs_app/types/resource.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;

  const ResourceCard({
    required this.resource,
    super.key,
  });

  void _launchURL(String url, BuildContext context) async {
    Uri uri = Uri.parse(url);

    final res = await launchUrl(uri);

    if (!res && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: "Dismiss",
            onPressed: () {},
          ),
          content: const Text("Could not open URL."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: InkWell(
        onTap: () => _launchURL(resource.url, context),
        child: Card(
          color: Theme.of(context).colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          elevation: 5.0,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Expanded(child: Image.asset(resource.imagePath)),
              Text(resource.name)
            ],
          ),
        ),
      ),
    );
  }
}
