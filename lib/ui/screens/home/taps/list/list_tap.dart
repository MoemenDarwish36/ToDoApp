import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todos/ui/screens/home/taps/list/list_item.dart';

class ListTap extends StatefulWidget {
  const ListTap({super.key});

  @override
  State<ListTap> createState() => ListTapState();
}

class ListTapState extends State<ListTap> {
  ///this variable to controls a date what user choice in calender
  DateTime selectedCalendarDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCalendar(),
        Expanded(
          child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return const ListItem();
              }),
        ),
      ],
    );
  }

  buildCalendar() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
      ),
      dayProps: const EasyDayProps(
        dayStructure: DayStructure.dayStrDayNumMonth,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3371FF),
                Color(0xff8426D6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
