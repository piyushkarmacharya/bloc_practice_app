// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int uid;
  final String name;
  final String token;
  User({
    required this.uid,
    required this.name,
    required this.token,
  });

  User copyWith({
    int? uid,
    String? name,
    String? token,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as int,
      name: map['name'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(uid: $uid, name: $name, token: $token)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.name == name && other.token == token;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ token.hashCode;
}
