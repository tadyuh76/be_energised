List<int> percentageToCells(int percentage) {
  if (percentage == 0) return [];

  int remainBattery = percentage;
  List<int> batteryCells = [];

  while (remainBattery >= 20) {
    batteryCells.add(20);
    batteryCells.add(-1); // space
    remainBattery -= 20;
  }
  if (remainBattery == 0) {
    batteryCells.last = remainBattery;
  } else {
    batteryCells.add(remainBattery);
  }

  return batteryCells;
}
