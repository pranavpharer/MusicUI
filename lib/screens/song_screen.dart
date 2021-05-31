import 'package:flutter/material.dart';
import 'package:pracsmusic/screens/album_list_screen.dart';

import '../widgets/player.dart';
import '../widgets/pbutton_widget.dart';
import '../widgets/bbutton.dart';
import '../widgets/playbutton.dart';

class SongPage extends StatefulWidget {
  static final route = '/SongPage';
  @override
  _SongPageState createState() => _SongPageState();

}

class _SongPageState extends State<SongPage> {

  double _minVal = 100.0;

  //double _maxVal;
  bool isPlaying = false;
  IconData faIcon = Icons.play_arrow;
  double firstOffset = 5.0;
  double secondOffset = -5.0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Color(0xFFD4E0E8),
      body: Container(
        padding: EdgeInsets.only(top: height * 0.05, left: width * 0.05, right: width *0.05),
        height: height,
        width: width,
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Color(0xFFEdEDF0), Color(0xFF4E0E8)],
          ),
        ),*/
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                onTap: ()=>Navigator.of(context).pushNamed(AlbumList.route),child: bButton(Icons.arrow_back, context),),
                Spacer(),
                Text(
                  'Playing',
                  style: TextStyle(
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(3.0, 4.0),
                        blurRadius: 10,
                        color: Colors.black,
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 0.25,
                  ),
                ),
                Spacer(),
                InkWell(
                  /*onTap: () =>
                      Navigator.of(context).pushNamed(Player.route),*/
                  child: bButton(Icons.menu, context),
                ),
              ],
            ),
            /* SizedBox(
              height: 0.03 * MediaQuery.of(context).size.height,
            ),*/
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: height * 0.4,
                width: width * 0.8,
                decoration: BoxDecoration(
                  shape: BoxShape
                      .circle, /*boxShadow: [
                  new BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, -20),
                      blurRadius: 10),
                  new BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 40),
                    //spreadRadius: 20,
                    blurRadius: 20,
                  ),
                ],*/
                ),
                //color: Colors.yellowAccent,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage(
                        'Assets/images/EM.jpg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /*SizedBox(
              height: 0.04 * MediaQuery.of(context).size.height,
            ),*/
            RichText(
              text: TextSpan(
                  text: 'Leaving Heaven',
                  style: TextStyle(
                      fontSize: mediaQuery.textScaleFactor * 35,
                      color: Colors.black),),
            ),
            SizedBox(
              height: mediaQuery.textScaleFactor * 7,
            ),
            Text(
              'Eminem',
              style: TextStyle(
                  fontSize: mediaQuery.textScaleFactor * 18,
                  color: Colors.black45),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              child: Player(),
            ),


            Row(
              children: <Widget>[
                Text(
                  (_minVal / 60).toStringAsFixed(0) +
                      ':' +
                      (_minVal % 60).toStringAsFixed(0),
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                Spacer(
                  //flex: 1,
                ),
                Text(
                  '05:36',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton( onPressed: null,
                  icon: Icon(
                    Icons.autorenew,
                  ),
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.shuffle), onPressed: null)
              ],
            ),
            Row(
              children: <Widget>[
                Spacer(),
                pButton(Icons.skip_previous, context),
                SizedBox(
                  width: width * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    if (isPlaying == true) {
                      setState(() {
                        faIcon = Icons.play_arrow;
                        isPlaying = !isPlaying;
                        firstOffset = -5.0;
                        secondOffset = -5.0;
                      });
                    } else if (isPlaying == false) {
                      setState(() {
                        faIcon = Icons.pause;
                        isPlaying = !isPlaying;
                        firstOffset = 5.0;
                        secondOffset = 5.0;
                      });
                    }
                  },
                  child: playButton(
                      faIcon, firstOffset, secondOffset, context),),
                SizedBox(
                  width: width * 0.1,
                ),
                pButton(Icons.skip_next, context),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}



