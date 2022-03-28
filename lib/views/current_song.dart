import 'package:flutter/material.dart';
import 'package:queue/info.dart';

class CurrentSongWidget extends StatefulWidget {
  const CurrentSongWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CurrentSongWidget> createState() => _CurrentSongWidgetState();
}

class _CurrentSongWidgetState extends State<CurrentSongWidget> {
  int _counter = 0;

//This is where code for queue ordering will go
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MUSICPLAYERHEIGHT,
          color: Colors.black,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(color: Colors.pink),
              Column(
                children: const [
                  Text("song title"),
                  Text("song artist"),
                ],
              ),
              OutlinedButton(
                  onPressed: () => debugPrint("test"),
                  child: const Icon(Icons.play_arrow, color: Colors.amber))
            ],
          )),
    );
  }
}
