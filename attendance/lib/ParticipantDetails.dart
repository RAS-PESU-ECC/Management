import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ParticipantDetails extends StatelessWidget {
  String what = "";
  int index;
  ParticipantDetails({@required String what, @required int index});
  final title = 'Participant\'s Detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.indigo[600],
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text("Name of the participant"),
                  subtitle: Text("Registration ID of the participant"),
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text("University"),
                  subtitle: Text("Semester of the participant and the Branch"),
                  leading: CircleAvatar(
                    child: Icon(Icons.work),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Text("Phone Number"),
                  // subtitle: Text("Semester of the participant and the Branch"),
                  leading: CircleAvatar(
                    child: Icon(Icons.call),
                  ),
                  onLongPress: () {
                    print("Call this persson please");
                  },
                ),
              ],
            ),
          ),
          Card(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                          child: IconButton(
                            onPressed: () {
                              print("this button is working");
                            },
                            icon: Icon(FontAwesomeIcons.utensilSpoon, color: Colors.white,),
                            iconSize: 50,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                          child: IconButton(
                            onPressed: () {
                              print("this button is working");
                            },
                            icon: Icon(FontAwesomeIcons.cookieBite, color: Colors.white,),
                            iconSize: 50,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                          child: IconButton(
                            onPressed: () {
                              print("this button is working");
                            },
                            icon: new Icon(FontAwesomeIcons.registered, color: Colors.white,),
                            iconSize: 50,
                          ),
                        ),
                      ),
                    ],
                  )))
        ],
      )),
    );
  }
}
