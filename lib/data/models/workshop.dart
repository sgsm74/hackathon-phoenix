import 'dart:convert';

class Workshop {
  String avatar;
  String name;
  double rating;
  Workshop({
    required this.avatar,
    required this.name,
    required this.rating,
  });

  Workshop copyWith({
    String? avatar,
    String? name,
    double? rating,
  }) {
    return Workshop(
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'name': name,
      'rating': rating,
    };
  }

  factory Workshop.fromMap(Map<String, dynamic> map) {
    return Workshop(
      avatar: map['avatar'],
      name: map['name'],
      rating: map['rating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Workshop.fromJson(String source) =>
      Workshop.fromMap(json.decode(source));

  @override
  String toString() =>
      'Workshop(avatar: $avatar, name: $name, rating: $rating)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Workshop &&
        other.avatar == avatar &&
        other.name == name &&
        other.rating == rating;
  }

  @override
  int get hashCode => avatar.hashCode ^ name.hashCode ^ rating.hashCode;

  static List<Workshop> workshops() {
    List<Workshop> workshops = [
      Workshop(
          name: 'Stress Reduction',
          avatar: "assets/workshop/stress-reduction.png",
          rating: 2.3),
      Workshop(
          name: 'Mind Wellbeing',
          avatar: "assets/workshop/wellbeing.png",
          rating: 2.3),
      Workshop(
          name: 'Mental Health',
          avatar: "assets/workshop/mental-health.png",
          rating: 3.3),
    ];
    return workshops;
  }
}
