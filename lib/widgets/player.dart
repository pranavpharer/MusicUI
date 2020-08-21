import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Player extends StatefulWidget {
  static const String route = '/Player';

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  List<FlutterSliderHatchMarkLabel> effects = [];
  List<Map<dynamic, dynamic>> mEffects = [];
  double ellv = 10;
  double euuv = 20;

  void initState() {
    super.initState();

    List<double> rng = [15, 25, 35];
    for (double i = 0; i < 100; i++) {
      int x = (i % 3).round();
      mEffects.add({
        "percent": i,
        "size": 5 + rng[x].toDouble(),
      });
    }
    effects = updateEffects(
        ellv * 100 / mEffects.length, euuv * 100 / mEffects.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: FlutterSlider(
        // rangeSlider: true,
          min: 0,
          max: effects.length.toDouble(),
          values: [ellv, euuv],
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Colors.black,
                offset: Offset(2, 20),
                //spreadRadius: 20,
                blurRadius: 20,
              ),]
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Color(0xab920070),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.65), width: 1)),
            ),
          ),
          /*rightHandler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black.withOpacity(0.65), width: 1)),
                )),*/
          handlerWidth: 6,
          handlerHeight: 40,
          touchSize: 25,
          tooltip: FlutterSliderTooltip(
            format: (value) {
              return value;
            },
            textStyle: TextStyle(fontSize: 20),
            boxStyle: FlutterSliderTooltipBox(

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                //border: Border.all(color: Colors.black12, width: 1),
              ),
            ),
          ),
          hatchMark: FlutterSliderHatchMark(
            labels: effects,
            linesAlignment: FlutterSliderHatchMarkAlignment.right,
            density: 2,
          ),
          trackBar: FlutterSliderTrackBar(
            inactiveTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            activeTrackBarHeight: 2,
            inactiveTrackBarHeight: 4,
            activeTrackBar: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          onDragging: (a, b, c) {
            ellv = b;
            euuv = c;
            effects = updateEffects(
                b * 100 / mEffects.length, c * 100 / mEffects.length);
            setState(() {});
          }),
    );
  }

  List<FlutterSliderHatchMarkLabel> updateEffects(
      double leftPercent, double rightPercent) {
    List<FlutterSliderHatchMarkLabel> newLabels = [];
    for (Map<dynamic, dynamic> label in mEffects) {
      if (/*label['percent'] >= leftPercent &&*/ label['percent'] <=
          leftPercent) {
        newLabels.add(FlutterSliderHatchMarkLabel(
            percent: label['percent'],
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0),
              child: Container(
                height: label['size'],
                width: 2.5,
                color: Color(0XFF920070),
              ),
            )));
      } else {
        newLabels.add(
          FlutterSliderHatchMarkLabel(
            percent: label['percent'],
            label: Container(
              color: Color(0xffD4E0E8),
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Container(
                height: label['size'],
                width: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey,
                  border: Border.all(color: Colors.transparent, width: .5),
                ),
                //color: Colors.black,
              ),
            ),
          ),
        );
      }
    }
    return newLabels;
  }
}
