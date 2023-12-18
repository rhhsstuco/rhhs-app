import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home"),
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
