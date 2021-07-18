import 'dart:convert';

class Activity {
  String name;
  String avatar;
  double rating;
  Activity({
    required this.name,
    required this.avatar,
    required this.rating,
  });

  Activity copyWith({
    String? name,
    String? avatar,
    double? rating,
  }) {
    return Activity(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'rating': rating,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      name: map['name'],
      avatar: map['avatar'],
      rating: map['rating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source));

  @override
  String toString() =>
      'Activity(name: $name, avatar: $avatar, rating: $rating)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Activity &&
        other.name == name &&
        other.avatar == avatar &&
        other.rating == rating;
  }

  @override
  int get hashCode => name.hashCode ^ avatar.hashCode ^ rating.hashCode;

  static List<Activity> activities() {
    List<Activity> activitiesList = [
      Activity(
          name: 'Tennis', avatar: "assets/activity/tennis.png", rating: 2.3),
      Activity(
          name: 'Skate', avatar: "assets/activity/skateboard.png", rating: 2.3),
      Activity(name: 'Yoga', avatar: "assets/activity/yoga.png", rating: 3.3),
    ];
    return activitiesList;
  }
}
