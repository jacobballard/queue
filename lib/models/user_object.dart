import 'package:queue/models/song_object.dart';

class UserObject {
  final String id;
  final String username;

  const UserObject({required this.id, required this.username});

  factory UserObject.fromJson(Map<String, dynamic> json) {
    return UserObject(id: json['id'], username: json['username']);
  }
}
