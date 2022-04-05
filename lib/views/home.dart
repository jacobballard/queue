import 'package:flutter/material.dart';
import 'package:queue/info.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
            // children: <Widget>[
            //   StreamBuilder<QuerySnapshot>(
            //     stream:
            //         chatReference.orderBy('time', descending: true).snapshots(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (!snapshot.hasData) return new Text("No Chat");
            //       return Expanded(
            //         child: new ListView(
            //           reverse: true,
            //           children: generateMessages(snapshot),
            //         ),
            //       );
            //     },
            //   ),
            //   new Divider(height: 1.0),
            //   new Container(
            //     decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            //     child: _buildTextComposer(),
            //   ),
            //   new Builder(builder: (BuildContext context) {
            //     return new Container(width: 0.0, height: 0.0);
            //   })
            // ],
            ),
      ),
    );
  }

//   Widget _getMessageList() {
//     return Expanded(
//       child: FirebaseAnimatedList(
//         controller: _scrollController,
//         query: widget.messageDao.getMessageQuery(),
//         itemBuilder: (context, snapshot, animation, index) {
//           final json = snapshot.value as Map<dynamic, dynamic>;
//           final message = Message.fromJson(json);
//           return MessageWidget(message.text, message.date);
//         },
//       ),
//     );
//   }
}
