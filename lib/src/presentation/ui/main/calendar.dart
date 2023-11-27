import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:sauap_planner/src/presentation/widgets/appbar/custom_app_bar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: CalendarCarousel<Event>(
          locale: 'KK',
          onDayPressed: (DateTime date, List<Event> events) {
            setState(
              () => _currentDate = date,
            );
          },
          weekendTextStyle: const TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
          //      weekDays: null, /// for pass null when you do not want to render weekDays
          //      headerText: Container( /// Example for rendering custom header
          //        child: Text('Custom Header'),
          //      ),
          customDayBuilder: (
            /// you can provide your own build function to make custom day containers
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
          ) {
            /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
            /// This way you can build custom containers for specific days only, leaving rest as default.

            // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
            if (day.day == 15) {
              return const Center(
                child: Icon(Icons.local_airport),
              );
            } else {
              return null;
            }
          },
          weekFormat: false,
          height: 600,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: false,

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }
}
