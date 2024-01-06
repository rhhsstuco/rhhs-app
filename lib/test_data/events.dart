import 'dart:collection';

import 'package:rhhs_app/types/school_event.dart';
import 'package:table_calendar/table_calendar.dart';

final eventList = <SchoolEvent>[
  SchoolEvent(
    startDate: DateTime(2023, 12, 18),
    endDate: DateTime(2023, 12, 22),
    name: "Jollyweek",
    description:
        "Enjoy 5 days of holiday joy including a gingerbread house decorating contest!",
  ),
  SchoolEvent(
    startDate: DateTime(2023, 12, 22),
    endDate: DateTime(2023, 12, 22),
    name: "Flannel Day",
    description:
        "Wear flannel!",
  )
];

LinkedHashMap<DateTime, List<SchoolEvent>> _createEventMap(
    List<SchoolEvent> eventList) {
  final eventMap = LinkedHashMap<DateTime, List<SchoolEvent>>(
      equals: isSameDay,
      hashCode: (day) {
        return Object.hashAll([day.year, day.month, day.day]);
      });

  for (var event in eventList) {
    DateTime endDate = event.endDate ?? event.startDate;

    final dates = [
      for (var i = 0; i <= endDate.difference(event.startDate).inDays; i++)
        event.startDate.add(Duration(days: i)),
    ];

    for (var date in dates) {
      if (eventMap.containsKey(date)) {
        eventMap[date]?.add(event);
      } else {
        eventMap[date] = [event];
      }
    }
  }

  return eventMap;
}

final eventMap = _createEventMap(eventList);
