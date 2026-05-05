String formatMinutesToTime(int minutes) {
  final hours = minutes ~/ 60;
  final mins = minutes % 60;
  if (hours > 0) {
    return "$hours:${mins.toString().padLeft(2, '0')}  ${hours == 1 ? 'mins' : 'mi'}";
  }
  return "$mins:00";
}
