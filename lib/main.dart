import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pracsmusic/screens/album_list_screen.dart';

import 'package:pracsmusic/screens/song_screen.dart';
import 'widgets/player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Music Player',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: TextTheme(title: TextStyle(fontSize: 15, ))),
        home: AlbumList(),
        routes: {
          Player.route: (_) => Player(),
          SongPage.route:(_) =>SongPage(),
          AlbumList.route:(_) => AlbumList(),
        });
  }
}


