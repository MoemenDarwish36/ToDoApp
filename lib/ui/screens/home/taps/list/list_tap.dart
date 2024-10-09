import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/ui/provider/list_provider.dart';
import 'package:todos/ui/screens/home/taps/list/list_item.dart';

class ListTap extends StatefulWidget {
  const ListTap({super.key});

  @override
  State<ListTap> createState() => ListTapState();
}

class ListTapState extends State<ListTap> {
  @override
  // void initState() {
  //   super.initState();
  //   getAllTasksFromFireStore() ;
  // }
  late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    if (listProvider.tasksList.isEmpty) {
      listProvider.getAllTasksFromFireStore();
    }

    return Column(
      children: [
        buildCalendar(),
        Expanded(
          child: ListView.builder(
              itemCount: listProvider.tasksList.length,
              itemBuilder: (context, index) {
                return ListItem(
                  task: listProvider.tasksList[index],
                );
              }),
        ),
      ],
    );
  }

  buildCalendar() {
    return EasyDateTimeLine(
      initialDate: listProvider.selectedDate,
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
        listProvider.changeSelectData(selectedDate);
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
