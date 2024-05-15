import 'package:flutter/material.dart';
import 'package:sauap_planner/tasks/presentation/pages/tasks_screen.dart';
import 'package:sauap_planner/utils/color_palette.dart';
import 'package:sauap_planner/utils/font_sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    _selectedDay = _focusedDay;
    super.initState();
  }

  _onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    setState(
      () {
        _selectedDay = null;
        _focusedDay = focusDay;
        _rangeStart = start;
        _rangeEnd = end;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const taskScreen = TasksScreen();
    final taskCount = taskScreen.getTaskCount(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мамыр'),
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.poll_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          TableCalendar(
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Ай',
              CalendarFormat.week: 'Апта',
            },
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            onPageChanged: (focusDay) {
              _focusedDay = focusDay;
            },
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onRangeSelected: _onRangeSelected,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Сізде $taskCount тапсырма бар',
            style: const TextStyle(
              color: kDarkPurple,
              fontSize: textExtraLarge,
            ),
          ),
        ],
      ),
    );
  }
}
