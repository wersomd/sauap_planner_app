import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sauap_planner/src/presentation/widgets/category_card.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  late TextEditingController _titlecontroller;
  late TextEditingController _datecontroller;
  late TextEditingController _startTime;
  late TextEditingController _endTime;
  DateTime selectedDate = DateTime.now();
  String category = "Медицина";
  @override
  void initState() {
    super.initState();
    _titlecontroller = TextEditingController();
    _datecontroller = TextEditingController(
      text: DateFormat('EEE, MMM d, ' 'yy', 'kk').format(selectedDate),
    );
    _startTime = TextEditingController(
      text: DateFormat.jm('kk').format(
        DateTime.now(),
      ),
    );
    _endTime = TextEditingController(
      text: DateFormat.jm('kk').format(
        DateTime.now().add(
          const Duration(hours: 1),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        _datecontroller.text =
            DateFormat('EEE, MMM d, ' 'yy', 'kk').format(selected);
      });
    }
  }

  _selectTime(BuildContext context, String timeType) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (result != null) {
      setState(
        () {
          if (timeType == "StartTime") {
            _startTime.text = result.format(context);
          } else {
            _endTime.text = result.format(context);
          }
        },
      );
    }
  }

  _setCategory(String category) {
    setState(() {
      this.category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: blueColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Жаңа тапсырма қосу",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: TextFormField(
                    controller: _titlecontroller,
                    cursorColor: Colors.white,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      labelText: "Аты",
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
                      labelStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _datecontroller,
                    cursorColor: Colors.white,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Дата",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
                      labelStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextField(
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                                readOnly: true,
                                controller: _startTime,
                                decoration: InputDecoration(
                                  labelText: "Басталуы",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _selectTime(context, "StartTime");
                                    },
                                    child: const Icon(
                                      Icons.alarm,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                  ),
                                  fillColor: Colors.black26,
                                  labelStyle: GoogleFonts.montserrat(
                                    color: Colors.black26,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextField(
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                                readOnly: true,
                                controller: _endTime,
                                decoration: InputDecoration(
                                  labelText: "Бітуі",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _selectTime(context, "EndTime");
                                    },
                                    child: const Icon(
                                      Icons.alarm,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                  ),
                                  fillColor: Colors.black26,
                                  labelStyle: GoogleFonts.inter(
                                    color: Colors.black26,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 8,
                          cursorColor: Colors.black26,
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                            labelText: "Жазба",
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            fillColor: Colors.black26,
                            labelStyle: GoogleFonts.inter(
                              color: Colors.black26,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Категориялар",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _setCategory('Білім және ғылым');
                                  },
                                  child: CategoryCard(
                                    categoryText: 'Білім және ғылым',
                                    isActive: category == 'Білім және ғылым',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _setCategory('Медицина');
                                  },
                                  child: CategoryCard(
                                    categoryText: 'Медицина',
                                    isActive: category == 'Медицина',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _setCategory('Бизнес');
                                  },
                                  child: CategoryCard(
                                    categoryText: 'Бизнес',
                                    isActive: category == 'Бизнес',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _setCategory('Тазалық');
                                  },
                                  child: CategoryCard(
                                    categoryText: 'Тазалық',
                                    isActive: category == 'Тазалық',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _setCategory('Даму');
                                  },
                                  child: CategoryCard(
                                    categoryText: 'Даму',
                                    isActive: category == 'Даму',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _setCategory('Отбасы');
                                  },
                                  child: CategoryCard(
                                    categoryText: 'Отбасы',
                                    isActive: category == 'Отбасы',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _setCategory('Үй');
                                  },
                                  child: CategoryCard(
                                    categoryText: 'Үй',
                                    isActive: category == 'Үй',
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: blueColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Тапсырманы қосу",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
