import 'package:flutter/material.dart';
import 'package:queue/info.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:queue/models/queue_object.dart';
import 'package:queue/models/song_object.dart';
import 'package:queue/views/each_song.dart';
import '../helpers/queue_dao.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:queue/keys.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final queueDao = QueueDao.singleton;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final queueDao = QueueDao();
  // Keys kes = Keys();
  // String queue = kes.;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text(widget.title),
    //     ),
    //     body: Expanded(
    //       child: FirebaseAnimatedList(
    //         controller: _scrollController,
    //         query: widget.queueD,
    //         itemBuilder: (context, snapshot, animation, index) {
    //           final json = snapshot.value as Map<String, dynamic>;
    //           final queue = QueueObject.fromJson(json);
    //           //This looks broken.  How does it know index of the list of songs.  Need to rethink request
    //           return IndividualSongWidget(
    //               title: (queue.songs[index] as SongObject).title,
    //               artist: (queue.songs[index] as SongObject).artist,
    //               songImageURL: (queue.songs[index] as SongObject).songImageURL,
    //               songID: (queue.songs[index] as SongObject).id);
    //         },
    //       ),
    //     ));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text("test"),
    );
  }
}
