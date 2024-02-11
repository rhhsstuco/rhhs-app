import 'package:flutter/material.dart';
import 'package:rhhs_app/test_data/resources.dart';
import 'package:rhhs_app/widgets/resource_card.dart';

class ResourceList extends StatelessWidget {
  const ResourceList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: resourceList.length,
      itemBuilder: (context, index) {
        return ResourceCard(resource: resourceList.elementAt(index));
      },
    );
  }
}
