import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/auth_user_provider.dart';
import '../../../../../provider/list_provider.dart';
import '../../../../../provider/theme_provider.dart';
import '../../../../utilities/app_color.dart';
import 'list_item.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => ListTabState();
}

class ListTabState extends State<ListTab> {
  // void initState() {
  //   super.initState();
  //   getAllTasksFromFireStore() ;
  // }
  late ListProvider listProvider;
  late ThemeProvider themeProvider;
  late AuthUserProvider authUserProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    listProvider = Provider.of(context);
    authUserProvider = Provider.of(context);
    if (listProvider.tasksList.isEmpty) {
      listProvider.getAllTasksFromFireStore(authUserProvider.currentUser!.id!);
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
      activeColor: themeProvider.isDarkThemeEnabled
          ? AppColors.white
          : AppColors.primaryColor,
      initialDate: listProvider.selectedDate,
      onDateChange: (selectedDate) {
        // `selectedDate` the new date selected.
        listProvider.changeSelectData(
            selectedDate, authUserProvider.currentUser!.id!);
      },
      headerProps: EasyHeaderProps(
        monthStyle: TextStyle(
          color: themeProvider.isDarkThemeEnabled
              ? AppColors.white
              : AppColors.black,
        ),
        selectedDateStyle: TextStyle(
          color: themeProvider.isDarkThemeEnabled
              ? AppColors.white
              : AppColors.black,
        ),
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: const DateFormatter.fullDateDMonthAsStrY(),
      ),
      dayProps: EasyDayProps(
        todayStyle: DayStyle(
            dayNumStyle: TextStyle(
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.white
                  : AppColors.black,
            ),
            decoration: BoxDecoration(
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.blackDarkColor
                  : AppColors.white,
            )),
        inactiveDayStyle: DayStyle(
            monthStrStyle: TextStyle(
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.white
                  : AppColors.black,
            ),
            dayStrStyle: TextStyle(
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.white
                  : AppColors.black,
            ),
            dayNumStyle: TextStyle(
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.white
                  : AppColors.black,
            ),
            decoration: BoxDecoration(
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.blackDarkColor
                  : AppColors.white,
            )),
        dayStructure: DayStructure.dayStrDayNumMonth,
        activeDayStyle: DayStyle(
          monthStrStyle: TextStyle(
            color: themeProvider.isDarkThemeEnabled
                ? AppColors.white
                : AppColors.black,
          ),
          dayStrStyle: TextStyle(
            color: themeProvider.isDarkThemeEnabled
                ? AppColors.white
                : AppColors.black,
          ),
          dayNumStyle: TextStyle(
            color: themeProvider.isDarkThemeEnabled
                ? AppColors.white
                : AppColors.black,
          ),
          decoration: const BoxDecoration(
            // color: Color(0xff3371FF),
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
