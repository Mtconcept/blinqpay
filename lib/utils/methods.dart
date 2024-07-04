import 'package:intl/intl.dart';

String convertTimeStamp(unixTimestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  String formattedDate = DateFormat.yMd().format(dateTime);
  return formattedDate;
}
