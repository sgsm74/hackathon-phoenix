import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String avatar;
  final String biography;
  final double rating;
  final int score;
  final int isTrainer;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.biography,
    required this.rating,
    required this.score,
    required this.isTrainer,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? avatar,
    String? biography,
    double? rating,
    int? score,
    int? isTrainer,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      biography: biography ?? this.biography,
      rating: rating ?? this.rating,
      score: score ?? this.score,
      isTrainer: isTrainer ?? this.isTrainer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'biography': biography,
      'rating': rating,
      'score': score,
      'isTrainer': isTrainer,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      avatar: map['avatar'],
      biography: map['biography'],
      rating: map['rating'],
      score: map['score'],
      isTrainer: map['isTrainer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, avatar: $avatar, biography: $biography, rating: $rating, score: $score, isTrainer: $isTrainer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar &&
        other.biography == biography &&
        other.rating == rating &&
        other.score == score &&
        other.isTrainer == isTrainer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        biography.hashCode ^
        rating.hashCode ^
        score.hashCode ^
        isTrainer.hashCode;
  }

  static List<User> users() {
    List<User> users = [
      User(
        avatar: 'assets/users/kevin.png',
        biography:
            'Hey there! I’m Kevin, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        name: '',
        id: 1,
        rating: 2.3,
        score: 0,
        isTrainer: 0,
      ),
      User(
        avatar: 'assets/users/connie.png',
        biography:
            'Hey there! I’m Connie, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        name: 'Connie',
        id: 2,
        rating: 2.8,
        score: 0,
        isTrainer: 0,
      ),
      User(
        avatar: 'assets/users/sarah.png',
        biography:
            'Hey there! I’m Sarah, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        name: 'Sarah',
        id: 3,
        rating: 3.8,
        score: 0,
        isTrainer: 0,
      ),
      User(
        avatar: 'assets/users/dom.png',
        biography:
            'Hey there! I’m Dom, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        name: 'Dom',
        id: 4,
        rating: 3.8,
        score: 0,
        isTrainer: 0,
      ),
      User(
        avatar: 'assets/users/lisa.png',
        biography:
            'Hey there! I’m Lisa, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        name: 'Lisa',
        id: 5,
        rating: 3.8,
        score: 0,
        isTrainer: 0,
      ),
    ];
    return users;
  }
}
