import 'package:intl/intl.dart';

///this extension to add function in DateTime
extension TimeExtension on DateTime {
  String get toFormattedDate {
    DateFormat formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }

  ///this list to add dayName to use  in calender
  String get dayName {
    List<String> days = ["mon", "tue", "wed", "thurs", "fri", "sat", "sun"];
    return days[weekday - 1];
  }
}
