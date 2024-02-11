import 'package:flutter/material.dart';
import 'package:rhhs_app/widgets/resource_list.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResourceList();
  }
}

class ResourcesScreenAppBar extends StatelessWidget {
  const ResourcesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Resources");
  }
}
