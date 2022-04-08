import 'package:firebase_database/firebase_database.dart';
import '../models/song_object.dart';

class QueueDao {
  final DatabaseReference _queueRef = FirebaseDatabase.instance.ref("queues");

  void addToQueue(SongObject song) {
    _queueRef.push().set(song.toJson());
  }

  Query getQueueQuery() {
    return _queueRef;
  }

  Query getQueueSongsQuery() {
    return _queueRef;
  }
}
