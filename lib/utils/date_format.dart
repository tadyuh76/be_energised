String getDate(DateTime date) {
  return date.toString().substring(0, 10);
}

String getTime(DateTime date) {
  return date.toString().substring(11, 16);
}
