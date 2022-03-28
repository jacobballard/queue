import 'package:flutter/material.dart';

class IndividualSongWidget extends StatefulWidget {
  const IndividualSongWidget(
      {Key? key,
      required this.title,
      required this.artist,
      required this.songImageURL})
      : super(key: key);

  final String title;
  final String artist;
  final String songImageURL;

  @override
  State<IndividualSongWidget> createState() => _IndividualSongWidget();
}

class _IndividualSongWidget extends State<IndividualSongWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Row(children: [
        Container(
          child: Image.network(
            widget.songImageURL,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Column(
          children: [
            Text(widget.title),
            Text(widget.artist),
          ],
        ),
        ElevatedButton(
            onPressed: () => debugPrint("add to queue"),
            child: const Icon(Icons.add_circle_outline_outlined))
      ]),
    );
  }
}
