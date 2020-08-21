import 'package:flutter/material.dart';


Widget playButton(IconData icon,double firstOffset,double secondOffset, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff920070),
        boxShadow: [
          new BoxShadow(
            color: Colors.white70,
            offset: Offset(firstOffset, firstOffset),
            blurRadius: 7,
          ),
          new BoxShadow(
            color: Colors.black45,
            offset: Offset(secondOffset, secondOffset),
            blurRadius: 7,
          ),
        ]),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: Color(0xaaD4E6E8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xaf920070),
            Color(0xbf920070),
            Colors.black,

          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(
          icon,
          size: 0.05 * MediaQuery.of(context).size.height,
          color: Colors.white,
        ),
      ),
    ),
  );
}
