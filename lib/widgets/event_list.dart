import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rhhs_app/types/school_event.dart';

class EventList extends StatelessWidget {
  static final DateFormat formatter = DateFormat.MMMMd();
  final DateTime? selectedDate;
  final List<SchoolEvent>? eventList;

  const EventList({
    super.key,
    required this.selectedDate,
    required this.eventList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatter.format(selectedDate!),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          width: double.infinity,
          height: 5,
        ),
        if (eventList != null && eventList!.isNotEmpty)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 0,
              ),
              itemCount: eventList?.length ?? 0,
              itemBuilder: (context, index) {
                final event = eventList![index];
                return ListTile(
                  title: Text(
                    event.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    event.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  minVerticalPadding: 0,
                );
              },
            ),
          ),
        if (eventList != null && eventList!.isEmpty)
          Text(
            "No events on this day.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
      ],
    );
  }
}
