import 'package:flutter/material.dart';
import 'package:rhhs_app/types/school_event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final void Function(DateTime, List<SchoolEvent>) onDateSelect;
  final Map<DateTime, List<SchoolEvent>> eventMap;

  const CalendarWidget({
    required this.onDateSelect,
    required this.eventMap,
    super.key,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDate = DateTime.now();
  DateTime? _selectedDate;
  List<SchoolEvent>? _selectedEvents;

  List<SchoolEvent> _getEventsForDay(DateTime day) {
    return widget.eventMap[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    if (!isSameDay(_selectedDate, selectedDate)) {
      setState(() {
        _selectedDate = selectedDate;
        _focusedDate = focusedDate;
        _selectedEvents = _getEventsForDay(selectedDate);
      });

      widget.onDateSelect(_selectedDate!, _selectedEvents!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<SchoolEvent>(
      firstDay: DateTime.utc(2010, 1, 20),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDate,
      eventLoader: _getEventsForDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDate, day);
      },
      onDaySelected: _onDaySelected,
      onPageChanged: (focusedDay) {
        _focusedDate = focusedDay;
      },
    );
  }
}
