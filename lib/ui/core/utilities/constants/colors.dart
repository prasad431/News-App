import 'package:flutter/material.dart';

Color blackcolor = Colors.black;
Color whitecolor = Colors.white;
Color redcolor({int stroke = 600, bool accent = false}) =>
    accent == true ? Colors.redAccent[stroke] : Colors.red[stroke];

Color greencolor({int stroke = 600, bool accent = false}) =>
    accent == true ? Colors.greenAccent[stroke] : Colors.green[stroke];

Color yellowcolor({int stroke = 600, bool accent = false}) =>
    accent == true ? Colors.yellowAccent[stroke] : Colors.yellow[stroke];

Color bluecolor({int stroke = 600, bool accent = false}) =>
    accent == true ? Colors.blueAccent[stroke] : Colors.blue[stroke];

Color lightbluecolor({int stroke = 600, bool accent = false}) =>
    accent == true ? Colors.lightBlueAccent[stroke] : Colors.lightBlue[stroke];

Color lightgreencolor({int stroke = 600, bool accent = false}) => accent == true
    ? Colors.lightGreenAccent[stroke]
    : Colors.lightGreen[stroke];

Color bluegreycolor({int stroke = 600}) => Colors.blueGrey[stroke];

Color greycolor({int stroke = 600}) => Colors.grey[stroke];

Color tealcolor({int stroke = 600, bool accent = false}) =>
    accent == true ? Colors.tealAccent[stroke] : Colors.teal[stroke];
