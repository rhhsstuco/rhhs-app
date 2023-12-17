import 'package:flutter/material.dart';
import 'package:rhhs_app/test_data/events.dart';
import 'package:rhhs_app/types/school_event.dart';
import 'package:rhhs_app/widgets/calendar.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<SchoolEvent>? _eventList;

  void onDateSelect(DateTime selectedDate, List<SchoolEvent> eventList) {
    setState(() {
      _eventList = eventList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarWidget(
          onDateSelect: onDateSelect,
          eventMap: eventMap,
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _eventList?.length ?? 0,
            itemBuilder: (context, index) {
              final event = _eventList![index];
              return ListTile(
                title: Text(event.name),
                subtitle: Text(event.description),
              );
            },
          ),
        ),
      ],
    );
  }
}
