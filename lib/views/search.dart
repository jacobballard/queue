import 'package:flutter/material.dart';
import 'package:queue/views/current_song.dart';
import 'package:queue/views/each_song.dart';
import 'package:queue/models/song_object.dart';
import 'package:queue/helpers/search_requests.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<SongObject>> songResults;
  String _searchText = "";
  final TextEditingController _filter = TextEditingController();
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text("Search");

  //init
  _SearchPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//This is where code for queue ordering will go
  void _searchForSongs() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildBar(context),
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  PreferredSizeWidget _buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      // Search napster

      return FutureBuilder<List<SongObject>>(
          future: songResults = SearchRequests().search(_searchText),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SongObject> data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return IndividualSongWidget(
                      title: data[index].title,
                      artist: data[index].artist,
                      songImageURL: data[index].songImageURL);
                },
              );
            } else {
              return Container();
            }
          });
    } else {
      return Container();
    }
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _filter,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search...",
          ),
        );
      } else {
        _searchIcon = const Icon(Icons.search);
        _appBarTitle = const Text("Search");
        _filter.clear();
      }
    });
  }

  // void _
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 50,
//             floating: true,
//             pinned: true,
//             snap: false,
//             centerTitle: false,
//             bottom: AppBar(
//               title: Container(
//                 width: double.infinity,
//                 height: 40,
//                 color: Colors.white,
//                 child: const Center(
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: 'Search for a song',
//                         suffixIcon: Icon(Icons.search)),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Other Sliver Widgets
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 if (songResults?.isNotEmpty ?? false) {
//                   return IndividualSongWidget(
//                       title: songResults?[index].title ?? "title",
//                       artist: songResults?[index].artist ?? "artist",
//                       songImageURL: songResults?[index].songImageURL ?? "na");
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
}
