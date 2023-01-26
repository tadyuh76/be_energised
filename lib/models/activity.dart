class Activity {
  String date;
  String name;
  String icon;
  int prevPercentage;
  int curPercentage;
  String time;

  Activity({
    required this.date,
    required this.name,
    required this.icon,
    required this.prevPercentage,
    required this.curPercentage,
    required this.time,
  });

  Activity copyWith({
    String? date,
    String? name,
    String? icon,
    int? prevPercentage,
    int? curPercentage,
    String? time,
  }) {
    return Activity(
      date: date ?? this.date,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      prevPercentage: prevPercentage ?? this.prevPercentage,
      curPercentage: curPercentage ?? this.curPercentage,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'name': name,
      'icon': icon,
      'prevPercentage': prevPercentage,
      'curPercentage': curPercentage,
      'time': time,
    };
  }

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      date: json['date'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      prevPercentage: json['prevPercentage']?.toInt() ?? 0,
      curPercentage: json['curPercentage']?.toInt() ?? 0,
      time: json['time'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Activity(date: $date, name: $name, icon: $icon, prevPercentage: $prevPercentage, curPercentage: $curPercentage, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Activity &&
        other.date == date &&
        other.name == name &&
        other.icon == icon &&
        other.prevPercentage == prevPercentage &&
        other.curPercentage == curPercentage &&
        other.time == time;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        name.hashCode ^
        icon.hashCode ^
        prevPercentage.hashCode ^
        curPercentage.hashCode ^
        time.hashCode;
  }
}
