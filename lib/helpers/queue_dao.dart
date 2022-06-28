import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/song_object.dart';

class QueueDao {
  static final QueueDao singleton = QueueDao._privateConstructor();
  static var _queueID;

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  QueueDao._privateConstructor();

  factory QueueDao(db) => singleton;

  final _user = FirebaseAuth.instance.currentUser;

  // void addToQueue(SongObject song) {
  //   _queueRef.push().set(song.toJson());
  // }

  // Query getQueueQuery() {
  //   return _db.ref("queues/$_queueID");
  // }

  // Query getQueueSongsQuery() {
  //   return _queueRef;
  // }
}
