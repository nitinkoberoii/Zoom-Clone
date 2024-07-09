import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/colors.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final ValueNotifier<DateTime> _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          'Calendar',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDay.value,
              selectedDayPredicate: (day) => isSameDay(_selectedDay.value, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay.value, selectedDay)) {
                  setState(() {
                    _selectedDay.value = selectedDay;
                  });
                }
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
