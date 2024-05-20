import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sauap_planner/components/widgets.dart';
import 'package:sauap_planner/tasks/presentation/pages/tasks_screen.dart';
import 'package:sauap_planner/utils/color_palette.dart';
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
    setState(() {
      _selectedDay = null;
      _focusedDay = focusDay;
      _rangeStart = start;
      _rangeEnd = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    const taskScreen = TasksScreen();
    final tasks = taskScreen.getTasks(context);
    final taskCount = tasks.length;

    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
        title: buildText(
          DateFormat.MMMM("kk_KK").format(DateTime.now()),
          kBlackColor,
          22,
          FontWeight.w400,
          TextAlign.center,
          TextOverflow.clip,
        ),
        leading: const Icon(Icons.menu),
        backgroundColor: kTransparentColor,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [],
              ),
              child: TableCalendar(
                locale: 'kk_KK',
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Ай',
                  CalendarFormat.week: 'Апта',
                },
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2030, 1, 1),
                onPageChanged: (focusDay) {
                  _focusedDay = focusDay;
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kPrimaryColor, kSecondColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  defaultTextStyle: TextStyle(color: Colors.black54),
                  weekendTextStyle: TextStyle(color: Colors.black54),
                  disabledTextStyle: TextStyle(color: Colors.grey),
                ),
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
            ),
            const SizedBox(height: 30),
            buildText(
              "Сізде $taskCount тапсырма бар",
              kDarkPurple,
              20,
              FontWeight.w500,
              TextAlign.center,
              TextOverflow.clip,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: const [],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [kPrimaryColor, kSecondColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            task.completed
                                ? Icons.check
                                : Icons.circle_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('HH:mm').format(task.startDateTime!),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                task.title,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
