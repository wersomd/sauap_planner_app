import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sauap_planner/components/widgets.dart';
import 'package:sauap_planner/tasks/data/local/model/task_model.dart';
import 'package:sauap_planner/utils/font_sizes.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/task_app_bar.dart';
import '../../../utils/color_palette.dart';
import '../../../utils/util.dart';
import '../bloc/tasks_bloc.dart';
import '../../../components/build_text_field.dart';

class UpdateTaskScreen extends StatefulWidget {
  final TaskModel taskModel;

  const UpdateTaskScreen({super.key, required this.taskModel});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController sum = TextEditingController();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  TimeOfDay? _endTime;

  final charityList = [
    "ОФ Biz Birgemiz Qazaqstan",
    "Фонд Асар-Уме",
    "Фонд Харекет",
    "ОФ БІЛІМ - ҚАЗЫНА",
    "Фонд Шұғыла",
    "Дом мамы АНА ҮЙІ",
    "Нұр Мүбәрәк",
    "Фонд Батыр Боламын",
    "Rizyq Found",
    "ОФ Өмір сыйла",
    "Фонд Человек в маске",
  ];

  String selectedCharity = '';

  Future<TimeOfDay?> _selectTime(
      BuildContext context, TimeOfDay initialTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    return picked;
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
  void dispose() {
    title.dispose();
    description.dispose();
    sum.dispose();
    super.dispose();
  }

  @override
  void initState() {
    title.text = widget.taskModel.title;
    description.text = widget.taskModel.description;
    sum.text = widget.taskModel.sum;
    selectedCharity = widget.taskModel.charity;
    _endTime = widget.taskModel.endTime;
    _selectedDay = _focusedDay;
    _rangeStart = widget.taskModel.startDateTime;
    _rangeEnd = widget.taskModel.stopDateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: const TaskAppBar(
          title: 'Тапсырманы жаңарту',
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<TasksBloc, TasksState>(
              listener: (context, state) {
                if (state is UpdateTaskFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(getSnackBar(state.error, kRed));
                }
                if (state is UpdateTaskSuccess) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return ListView(
                  children: [
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
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
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
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: buildText(
                          _rangeStart != null && _rangeEnd != null
                              ? 'Тапсырма ${formatDate(dateTime: _rangeStart.toString())} - ${formatDate(dateTime: _rangeEnd.toString())}'
                              : 'Уақытты таңдаңыз',
                          kPrimaryColor,
                          textSmall,
                          FontWeight.w400,
                          TextAlign.start,
                          TextOverflow.clip),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            WidgetStateProperty.all<Color>(kPrimaryColor),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        final endTime =
                            await _selectTime(context, TimeOfDay.now());
                        if (endTime != null) {
                          setState(() {
                            _endTime = endTime;
                          });
                        }
                      },
                      child: buildText(
                        _endTime != null
                            ? 'Аяқтау уақыты: ${_endTime!.format(context)}'
                            : 'Аяқтау уақытын таңдаңыз',
                        kWhiteColor,
                        18,
                        FontWeight.w400,
                        TextAlign.center,
                        TextOverflow.clip,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildText('Атауы', kBlackColor, textMedium, FontWeight.bold,
                        TextAlign.start, TextOverflow.clip),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextField(
                        hint: "Атауы",
                        controller: title,
                        inputType: TextInputType.text,
                        fillColor: kWhiteColor,
                        onChange: (value) {}),
                    const SizedBox(
                      height: 20,
                    ),
                    buildText('Сипаттамасы', kBlackColor, textMedium,
                        FontWeight.bold, TextAlign.start, TextOverflow.clip),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextField(
                        hint: "Тапсырма сипаттамасы",
                        controller: description,
                        inputType: TextInputType.multiline,
                        fillColor: kWhiteColor,
                        onChange: (value) {}),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      dropdownColor: kWhiteColor,
                      decoration: const InputDecoration(
                        filled: false,
                        fillColor: kWhiteColor,
                        labelText: "Фондты таңдаңыз",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(width: 1, color: kPrimaryColor),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(width: 0, color: kDarkPurple),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(width: 0, color: kGrey1),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 0, color: kGrey1)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1, color: kRed)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1, color: kGrey1)),
                        focusColor: kWhiteColor,
                        hoverColor: kWhiteColor,
                      ),
                      items: charityList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            selectedCharity = newValue!;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BuildTextField(
                      hint: "Сумманы жазыңыз",
                      controller: sum,
                      inputType: TextInputType.number,
                      fillColor: kWhiteColor,
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          var taskModel = TaskModel(
                            id: widget.taskModel.id,
                            title: title.text,
                            description: description.text,
                            charity: selectedCharity,
                            sum: sum.text,
                            completed: widget.taskModel.completed,
                            startDateTime: _rangeStart,
                            stopDateTime: _rangeEnd,
                            endTime: _endTime,
                          );
                          context
                              .read<TasksBloc>()
                              .add(UpdateTaskEvent(taskModel: taskModel));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: buildText(
                            'Жаңарту',
                            kWhiteColor,
                            textMedium,
                            FontWeight.w600,
                            TextAlign.center,
                            TextOverflow.clip,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
