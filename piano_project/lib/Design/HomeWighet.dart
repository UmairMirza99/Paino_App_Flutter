import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:piano_project/Global/Global.dart';

import '../Containers_of_Design/Slider_Picture.dart';

class HomeWidget extends StatefulWidget {
  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  late String name = '.';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery.of(context).size.width < 600
            ? Center(child: Slide(context))
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    getData_Name(),
                    Desighn(context),
                  ],
                ),
              ));
  }

  Widget Desighn(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 1.8,
        child: Stack(
          children: [
            Container(
              width: 40 * 35,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: White_Button_P.length,
                itemBuilder: (context, index) {
                  return Containers_Numbering_Button(
                      context,
                      White_Button_P[index].Name,
                      White_Button_P[index].audio,
                      index);
                },
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: 40 * 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Black_Button_List.length,
                  itemBuilder: (contex, index) {
                    return Black_Button(
                        context,
                        Black_Button_List[index].margin,
                        Black_Button_List[index].Name,
                        Black_Button_List[index].audio,
                        index);
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget getData_Name() {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "$name",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget Black_Button(
      BuildContext context, double left, String text, String audio, int index) {
    return InkWell(
      onTap: () {
        final player = AudioPlayer();
        player.play(
          AssetSource(Black_Button_List[index].audio),
        );
        setState(() {
          name = Black_Button_List[index].Name;
        });
      },
      hoverColor: Colors.greenAccent,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: 20,
        margin: EdgeInsets.only(left: left),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset.zero),
            ],
            border: Border.all(
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside),
            color: Colors.black,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Containers_Numbering_Button(
      BuildContext context, String text, String audio, int index) {
    return InkWell(
      onTap: () {
        final player = AudioPlayer();
        player.play(AssetSource(audio));
        setState(() {
          name = White_Button_P[index].Name;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 40,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset.zero),
            ],
            border: Border.all(
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                text,
                style: const TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
