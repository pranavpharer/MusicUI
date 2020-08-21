import 'package:flutter/material.dart';

Widget bButton(IconData icon,BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffE9EDF0),
        boxShadow: [
          new BoxShadow(
            color: Colors.white70,
            offset: Offset(-5, 0),
            blurRadius: 7,
          ),
          new BoxShadow(
            color: Colors.black45,
            offset: Offset(1, 5),
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
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          icon,
          size: 0.035 * MediaQuery.of(context).size.height,
          color: Colors.black,
        ),
      ),
    ),
  );
}