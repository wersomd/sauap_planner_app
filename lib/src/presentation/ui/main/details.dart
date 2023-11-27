import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sauap_planner/src/presentation/ui/main/add_task.dart';
import 'package:sauap_planner/src/presentation/widgets/progress_card.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  DateTime _selectedDate = DateTime.now();
  void _onDateChange(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 30,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMMM, d, y', 'kk').format(_selectedDate),
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddNewTask(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                "Қосу",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  DatePicker(
                    locale: 'KK-kk',
                    height: 90,
                    DateTime.now(),
                    initialSelectedDate: _selectedDate,
                    selectionColor: blueColor,
                    onDateChange: _onDateChange,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Тапсырмалар",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ProgressCard(
                          projectName: "Физикалық қозғалыс",
                          completedPercent: 50,
                        ),
                        ProgressCard(
                          projectName: "Ағылшын тілі",
                          completedPercent: 50,
                        ),
                        ProgressCard(
                          projectName: "Таңғы ас ішу",
                          completedPercent: 30,
                        ),
                        ProgressCard(
                          projectName: "Жұмысты орындау",
                          completedPercent: 30,
                        ),
                        ProgressCard(
                          projectName: "Кофе ішу",
                          completedPercent: 30,
                        ),
                        ProgressCard(
                          projectName: "Код жазу",
                          completedPercent: 30,
                        ),
                        ProgressCard(
                          projectName: "Гимнастика",
                          completedPercent: 30,
                        ),
                        ProgressCard(
                          projectName: "Видео түсіру",
                          completedPercent: 30,
                        ),
                        ProgressCard(
                          projectName: "Финиш",
                          completedPercent: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
