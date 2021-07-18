import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String avatar;
  String biography;
  double rating;
  List<String> interest;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.avatar,
    required this.biography,
    required this.rating,
    required this.interest,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? avatar,
    String? biography,
    double? rating,
    List<String>? interest,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      biography: biography ?? this.biography,
      rating: rating ?? this.rating,
      interest: interest ?? this.interest,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'avatar': avatar,
      'biography': biography,
      'rating': rating,
      'interest': interest,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      avatar: map['avatar'],
      biography: map['biography'],
      rating: map['rating'],
      interest: List<String>.from(map['interest']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, email: $email, password: $password, avatar: $avatar, biography: $biography, rating: $rating, interest: $interest)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.avatar == avatar &&
        other.biography == biography &&
        other.rating == rating &&
        listEquals(other.interest, interest);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        avatar.hashCode ^
        biography.hashCode ^
        rating.hashCode ^
        interest.hashCode;
  }

  static List<User> users() {
    List<User> users = [
      User(
        avatar: 'assets/users/kevin.png',
        biography:
            'Hey there! I’m Kevin, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        firstName: 'Kevin',
        lastName: '',
        interest: ["Tennis", "Painting"],
        id: 1,
        password: '',
        rating: 2.3,
      ),
      User(
        avatar: 'assets/users/connie.png',
        biography:
            'Hey there! I’m Connie, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        firstName: 'Connie',
        lastName: '',
        interest: ["Tennis", "Yoga"],
        id: 2,
        password: '',
        rating: 2.8,
      ),
      User(
        avatar: 'assets/users/sarah.png',
        biography:
            'Hey there! I’m Sarah, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        firstName: 'Sarah',
        lastName: '',
        interest: ["Painting", "Yoga"],
        id: 3,
        password: '',
        rating: 3.8,
      ),
      User(
        avatar: 'assets/users/dom.png',
        biography:
            'Hey there! I’m Dom, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        firstName: 'Dom',
        lastName: '',
        interest: ["Painting", "Yoga"],
        id: 4,
        password: '',
        rating: 3.8,
      ),
      User(
        avatar: 'assets/users/lisa.png',
        biography:
            'Hey there! I’m Lisa, and I’m here to meet new people and build a network. I’m very regular in tennis and rate myself at 4.5 right now.I haven’t played badminton regularly/ competitively for about a decade, but looking to start playing seriously again. Solid 2.0 right now, need to get consistency back.',
        email: '',
        firstName: 'Lisa',
        lastName: '',
        interest: ["Painting", "Yoga"],
        id: 5,
        password: '',
        rating: 3.8,
      ),
    ];
    return users;
  }
}
