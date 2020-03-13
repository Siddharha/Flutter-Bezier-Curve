import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Bezir Curve Demo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Bezir Curve Demo'),
          backgroundColor: Color.fromRGBO(5, 39, 54, 1),
        ),
        body: Container(
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Container(
                  child: ClipPath(
                child: Image.network(
                    'https://www.w3schools.com/w3css/img_lights.jpg'),
                clipper: BottomWaveClipper(),
              )),
              Text('This is Sample')
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height / 1.5);
    //path.quadraticBezierTo(size.width/1.5, size.height/2,size.width,size.height/2)
    path.quadraticBezierTo(
        size.width / 1.2, size.height / 4, size.width, size.height / 4);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
