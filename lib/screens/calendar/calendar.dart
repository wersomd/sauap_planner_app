import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sauap_planner/components/custom_app_bar.dart';
import 'package:sauap_planner/components/custom_menu.dart';
import 'package:sauap_planner/components/widgets.dart';
import 'package:sauap_planner/tasks/presentation/bloc/tasks_bloc.dart';
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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kScaffoldColor,
      drawer: const CustomMenu(),
      appBar: CustomAppBar(
        title: DateFormat.MMMM("kk_KK").format(DateTime.now()),
        scaffoldKey: scaffoldKey,
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
                  setState(() {
                    _focusedDay = focusDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: kPrimaryColor,
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
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                if (state is TasksLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchTasksSuccess) {
                  final tasks = state.tasks;
                  final taskCount = tasks.length;

                  return Expanded(
                    child: Column(
                      children: [
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
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        task.completed
                                            ? Icons.check
                                            : Icons.circle_outlined,
                                        color: kPrimaryColor,
                                        size: 28,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildText(
                                            DateFormat('M/d/y')
                                                .format(task.startDateTime!),
                                            kGrey1,
                                            14,
                                            FontWeight.w300,
                                            TextAlign.start,
                                            TextOverflow.clip,
                                          ),
                                          const SizedBox(height: 5),
                                          buildText(
                                            task.title,
                                            kBlackColor,
                                            18,
                                            FontWeight.w500,
                                            TextAlign.start,
                                            TextOverflow.clip,
                                          )
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
                  );
                } else if (state is LoadTaskFailure) {
                  return Center(
                    child: buildText(
                      state.error,
                      kBlackColor,
                      textMedium,
                      FontWeight.normal,
                      TextAlign.center,
                      TextOverflow.clip,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
