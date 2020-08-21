import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pracsmusic/dummy.dart';
import 'package:pracsmusic/screens/song_screen.dart';

import '../widgets/bbutton.dart';

class AlbumList extends StatefulWidget {
  static final route = '/AlbumList';

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  bool isPlaying = false;
  IconData faIcon = Icons.play_arrow;
  double firstOffset = 5.0;
  double secondOffset = -5.0;
  bool isSelected = true;
  String selIndex = null;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: height * 0.05,
          left: width * 0.03,
          right: width * 0.03,
        ),
        color: Color(0xFFD4E0E8),
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                bButton(Icons.arrow_back, context),
                Spacer(),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: mediaQuery.textScaleFactor * 7,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Leaving Heaven',
                        style: TextStyle(
                            fontSize: mediaQuery.textScaleFactor * 25,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.textScaleFactor * 7,
                    ),
                    Text(
                      'Eminem',
                      style: TextStyle(
                          fontSize: mediaQuery.textScaleFactor * 20,
                          color: Colors.black45),
                    ),
                  ],
                ),
                Spacer(),
                bButton(Icons.menu, context),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              height: height * 0.25,
              width: width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage(
                    'Assets/images/EM.jpg',
                  ),
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0xFFD4E0E8),
                    offset: Offset(-5, -5),
                    blurRadius: 5,
                  ),
                  new BoxShadow(
                    color: Color(0xFFD4E0E8),
                    offset: Offset(5, 5),
                    spreadRadius: 10,
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(SongPage.route),
                    child: index == 2
                        ? Container(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15),),
                                border: Border.all(color: Color(0xffE8ECEF),width: 2.5,),
                                color: Color(0xFFD4E0E8),
                              boxShadow:[BoxShadow(
                                color: Colors.black12,
                                offset: Offset(4, 4),
                                spreadRadius: 1,
                                blurRadius: 2,
                              ),], ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical:5),
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            Dummy_Data[index].name, overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                fontSize: mediaQuery
                                                        .textScaleFactor *
                                                    18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height:
                                                mediaQuery.textScaleFactor *
                                                    9,
                                          ),
                                          Text(
                                            Dummy_Data[index].artist,overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                fontSize: mediaQuery
                                                        .textScaleFactor *
                                                    15,
                                                color: Colors.black45),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      pbButton(Icons.pause, context),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          Dummy_Data[index].name,
                                          style: TextStyle(
                                              fontSize:
                                                  mediaQuery.textScaleFactor *
                                                      18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          Dummy_Data[index].artist,
                                          style: TextStyle(
                                              fontSize:
                                                  mediaQuery.textScaleFactor *
                                                      15,
                                              color: Colors.black45),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    LbButton(
                                      Icons.play_arrow,
                                      context,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  );
                },
                itemCount: Dummy_Data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget LbButton(
    IconData icon,
    BuildContext context,
    /*double firstOffset,double secondOffset,*/
  ) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffE9EDF0),
          boxShadow: [
            new BoxShadow(
              color: Colors.white70,
              offset: Offset(-2, 5),
              blurRadius: 7,
            ),
            new BoxShadow(
              color: Colors.black45,
              offset: Offset(5, 5),
              blurRadius: 7,
            ),
          ]),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //color: Color(0xaaD4E6E8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            //end: Alignment.bottomLeft,
            colors: [
              Color(0xffEBECF0),
              Color(0xffDFE2EF),
              Color(0xFFD3D5DD),
              //Colors.black54,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Icon(
            icon,
            size: 0.03 * MediaQuery.of(context).size.height,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

Widget pbButton(
  IconData icon,
  BuildContext context,
  /*double firstOffset,double secondOffset,*/
) {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffE9EDF0),
        boxShadow: [
          new BoxShadow(
            color: Colors.white70,
            offset: Offset(-2, 5),
            blurRadius: 7,
          ),
          new BoxShadow(
            color: Colors.black45,
            offset: Offset(5, 5),
            blurRadius: 7,
          ),
        ]),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFFF00C4),
            Color(0xFF890069),
            Colors.black,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Icon(
          icon,
          size: 0.03 * MediaQuery.of(context).size.height,
          color: Colors.white,
        ),
      ),
    ),
  );
}

/*














  */
