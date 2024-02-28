class DateHelpers {
  static List<DateTime> generateDisabledDates() {
    List<DateTime> disabledDates = [];
    DateTime today = DateTime.now();
    DateTime startOfYear = DateTime(today.year, 1, 1);
    for (int i = -1; i >= startOfYear.difference(today).inDays; i--) {
      DateTime dateToAdd = today.add(Duration(days: i));
      disabledDates.add(dateToAdd);
    }

    return disabledDates;
  }
}
