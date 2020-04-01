DateTime epochsInSecondsToDateTime(int epochs) =>
    DateTime.fromMillisecondsSinceEpoch(epochs * 1000);

int dateTimeToEpochsInSeconds(DateTime dateTime) =>
    dateTime.millisecondsSinceEpoch ~/ 1000;

String dateTimeToString(DateTime dateTime) =>
    '${dateTime.day}/${dateTime.month}/${dateTime.year}';

bool compareDates(DateTime dateTime1, DateTime dateTime2) {
  return dateTime1.year == dateTime2.year &&
      dateTime1.month == dateTime2.month &&
      dateTime1.day == dateTime2.day;
}

String datetimeToNamedDay(DateTime dateTime) {
  return compareDates(dateTime, DateTime.now())
      ? 'Today'
      : dateTime.difference(DateTime.now()).inDays >= 1
          ? 'After 2 days'
          : 'Tomorrow';
}

