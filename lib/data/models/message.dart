import 'dart:convert';

import 'package:synergy/data/models/user.dart';

class Message {
  String text;
  User sender;
  bool unread;
  String time;
  Message({
    required this.text,
    required this.sender,
    required this.unread,
    required this.time,
  });

  Message copyWith({
    String? text,
    User? sender,
    User? receiver,
    bool? unread,
    String? time,
  }) {
    return Message(
      text: text ?? this.text,
      sender: sender ?? this.sender,
      unread: unread ?? this.unread,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'sender': sender.toMap(),
      'unread': unread,
      'time': time,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'],
      sender: User.fromMap(map['sender']),
      unread: map['unread'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(text: $text, sender: $sender,  unread: $unread, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.text == text &&
        other.sender == sender &&
        other.unread == unread &&
        other.time == time;
  }

  @override
  int get hashCode {
    return text.hashCode ^ sender.hashCode ^ unread.hashCode ^ time.hashCode;
  }
}
