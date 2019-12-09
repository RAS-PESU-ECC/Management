import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Scanner.dart';
import 'ParticipantDetails.dart';

class EventCards extends StatelessWidget {
  final List<Map<String, String>> CardVals;
  EventCards({@required this.CardVals});
  @override
  Widget build(BuildContext context) {
    // print(HomePageList[0]);
    // TODO: implement build
    return Scaffold(
        body: Container(
            child: ListView(
          children: List.generate(
              CardVals.length,
              (index) => makecard(context, CardVals[index]['Name'],
                  CardVals[index]['val'], CardVals[index]['Std'], index)),
        )
            ));
  }
}

Card makecard(
        BuildContext context, String text, String what, String isStudent, int index) =>
    Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.purple,
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[600],
            ],
          ),
        ),
        child: makeListTile(context, text, what, isStudent, index),
      ),
    );

ListTile makeListTile(
        BuildContext context, String text, String What, String isStudent, int index) =>
    ListTile(
        onTap: () {
          print(What);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      (isStudent == "1") ? ParticipantDetails(what: What, index: index) : Scanner(what: What, index: index)));
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        // leading: Container(
        //   padding: EdgeInsets.only(right: 12.0),
        //   // decoration: new BoxDecoration(
        //   //     border: new Border(
        //   //         right: new BorderSide(width: 1.0, color: Colors.white24))),
        //   child: Icon(Icons.people_outline, color: Colors.white),
        // ),
        title: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
        subtitle: (isStudent == "1")
            ? Text(What,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white))
            : null,
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
