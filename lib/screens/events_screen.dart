import 'package:flutter/material.dart';
import 'package:rhhs_app/test_data/events.dart';
import 'package:rhhs_app/types/school_event.dart';
import 'package:rhhs_app/widgets/calendar.dart';
import 'package:rhhs_app/widgets/event_list.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  DateTime? _selectedDate;
  List<SchoolEvent>? _eventList;

  void onDateSelect(DateTime selectedDate, List<SchoolEvent> eventList) {
    setState(() {
      _selectedDate = selectedDate;
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
        if (_selectedDate != null)
          const SizedBox(
            width: double.infinity,
            height: 25,
          ),
        if (_selectedDate != null)
          Expanded(
            child: EventList(
              selectedDate: _selectedDate,
              eventList: _eventList,
            ),
          )
      ],
    );
  }
}

class EventsScreenAppBar extends StatelessWidget {
  const EventsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Calendar");
  }
}
