extension DateTimeExtension on DateTime {
  String get getOnlyDate => '$year-$month-${day < 10 ? '0$day' : day} ';

  String get getDateWithTime => '$year-$month-${day < 10 ? '0$day' : day} ${hour < 10 ? '0$hour' : hour}:$minute';
}
