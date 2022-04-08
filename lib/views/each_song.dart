import 'package:flutter/material.dart';

class IndividualSongWidget extends StatefulWidget {
  const IndividualSongWidget(
      {Key? key,
      required this.title,
      required this.artist,
      required this.songImageURL,
      required this.songID})
      : super(key: key);

  final String title;
  final String artist;
  final String songImageURL;
  final String songID;

  @override
  State<IndividualSongWidget> createState() => _IndividualSongWidgetState();
}

class _IndividualSongWidgetState extends State<IndividualSongWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 1, right: 1, bottom: 1),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              child: Image(image: NetworkImage(widget.songImageURL)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title),
                Text(widget.artist),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
