import 'package:intl/intl.dart';

///this extension to add function in DateTime
extension TimeExtension on DateTime {
  String get toFormattedDate {
    DateFormat formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }
}
