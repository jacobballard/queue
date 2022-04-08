import 'package:flutter/material.dart';
import 'package:queue/views/home.dart';
import 'package:queue/views/current_song.dart';
import 'package:queue/views/search.dart';
import 'package:queue/info.dart';

class QTabBar extends StatefulWidget {
  const QTabBar({Key? key}) : super(key: key);

  @override
  _QTabBarState createState() => _QTabBarState();
}

// This is where the interesting stuff happens
class _QTabBarState extends State<QTabBar> with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CurrentSongWidget(title: "player"),
      appBar: AppBar(
        toolbarHeight: 0,
        // Use TabBar to show the three tabs
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.music_note, color: Colors.white),
            ),
            Tab(
              icon: Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyHomePage(
            title: "home",
          ),
          SearchPage(
            title: "search",
          ),
          // SubmitPage(
          //   onSubmit: () => showCupertinoDialog(
          //     context: context,
          //     builder: (_) {
          //       return CupertinoAlertDialog(
          //         title: const Text('Thank you'),
          //         content: const Text('Your application was submitted.'),
          //         actions: [
          //           CupertinoDialogAction(
          //             child: const Text('OK'),
          //             onPressed: () {
          //               // dismiss dialog
          //               Navigator.of(context).pop();
          //               _tabController.index = 0;
          //             },
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
