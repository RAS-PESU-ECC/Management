import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'media.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Scanner extends StatelessWidget {
  String what = "";
  int index;
  Scanner({@required this.what, @required this.index});
  @override
  Widget build(BuildContext context) {
    String text = HomePageList[index]["Name"];
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
              // automaticallyImplyLeading: true,
              centerTitle: true,
              title: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
              ),
              backgroundColor: Colors.indigo[600],
            ),
        body:ScanScreen(what: text),
    );
  }
}

class ScanScreen extends StatefulWidget {
  String what = "";
  ScanScreen({@required this.what});
  @override
  _ScanState createState() => new _ScanState(text: what);
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";
  String text = "";
  _ScanState({@required this.text});
  Timer timer;
  var whichColor = Colors.green;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var whichColor = Colors.amber;
    // print("Text: $text");
    if (barcode != "") {
      setState(() {
        whichColor = Colors.green;
        barcode = "";
      });
      Fluttertoast.showToast(
        msg: "Name: Amit Jha",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.indigo[600],
        textColor: Colors.white,
        fontSize: 20.0
    );
    }

    Timer(Duration(seconds: 1), () {
      if (barcode == "") {
        setState(() {
          whichColor = Colors.amber;
        });
      }
    });

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        color: whichColor,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    child: Container(
                        width: 150,
                        height: 150,
                        child: FloatingActionButton(
                          backgroundColor: Colors.indigo[600],
                          onPressed: scan,
                          child: Icon(
                            Icons.add,
                            size: 100,
                          ),
                        )),
                  ),
                ],
              ),
            )));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode = "");
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
