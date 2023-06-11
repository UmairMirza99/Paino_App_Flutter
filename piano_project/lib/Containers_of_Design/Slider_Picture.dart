import 'package:flutter/cupertino.dart';

Widget Slide(BuildContext context) {
  return Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/rotat.jpg'), fit: BoxFit.cover)),
    ),
  );
}
