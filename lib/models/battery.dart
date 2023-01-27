class Battery {
  String displayName;
  String photoURL;
  int percentage;
  int totalEnergy;
  String date;
  String? uid;
  int? friendEnergy;

  Battery({
    required this.displayName,
    required this.photoURL,
    required this.percentage,
    required this.totalEnergy,
    required this.date,
    this.uid,
    this.friendEnergy,
  });

  factory Battery.empty() {
    return Battery(
      displayName: "",
      photoURL: "",
      percentage: 0,
      totalEnergy: 0,
      date: "",
    );
  }

  factory Battery.newUser({
    required uid,
    required displayName,
    required photoURL,
  }) {
    return Battery(
      uid: uid,
      displayName: displayName,
      photoURL: photoURL,
      date: DateTime.now().toString(),
      percentage: 100,
      totalEnergy: 0,
    );
  }

  Battery charged(Battery battery) {
    return battery.copyWith(
      percentage: 100,
      date: DateTime.now().toString(),
    );
  }

  Battery copyWith({
    String? displayName,
    String? photoURL,
    int? percentage,
    int? totalEnergy,
    String? date,
    String? uid,
    int? friendEnergy,
  }) {
    return Battery(
      displayName: displayName ?? this.displayName,
      photoURL: photoURL ?? this.photoURL,
      percentage: percentage ?? this.percentage,
      totalEnergy: totalEnergy ?? this.totalEnergy,
      date: date ?? this.date,
      uid: uid ?? this.uid,
      friendEnergy: friendEnergy ?? this.friendEnergy,
    );
  }

  @override
  String toString() {
    return 'Battery(displayName: $displayName, photoURL: $photoURL, percentage: $percentage, totalEnergy: $totalEnergy, date: $date, uid: $uid, friendEnergy: $friendEnergy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Battery &&
        other.displayName == displayName &&
        other.photoURL == photoURL &&
        other.percentage == percentage &&
        other.totalEnergy == totalEnergy &&
        other.date == date &&
        other.uid == uid &&
        other.friendEnergy == friendEnergy;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
        photoURL.hashCode ^
        percentage.hashCode ^
        totalEnergy.hashCode ^
        date.hashCode ^
        uid.hashCode ^
        friendEnergy.hashCode;
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'photoURL': photoURL,
      'percentage': percentage,
      'totalEnergy': totalEnergy,
      'date': date,
      'uid': uid,
      'friendEnergy': friendEnergy,
    };
  }

  factory Battery.fromJson(Map<String, dynamic> json) {
    return Battery(
      displayName: json['displayName'] ?? '',
      photoURL: json['photoURL'] ?? '',
      percentage: json['percentage']?.toInt() ?? 0,
      totalEnergy: json['totalEnergy']?.toInt() ?? 0,
      date: json['date'] ?? '',
      uid: json['uid'],
      friendEnergy: json['friendEnergy']?.toInt(),
    );
  }
}
