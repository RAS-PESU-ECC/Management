import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'EventCard.dart';
import 'SearchPage.dart';
import 'media.dart';
import 'Admin.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'IEEE Event Management';

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
              )),
              backgroundColor: Colors.indigo[600],
            ),
            
            body: NavBar()
            
            )
            );
            
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // static List<Map<String, String>> whatToRender = [
  //   {'Name': 'Registration', 'val': 'reg'},
  //   {'Name': 'Dinner', 'val': 'din'},
  //   {'Name': 'Lunch', 'vin': 'lun'}
  // ];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List widgetOptions = [
    EventCards(CardVals: HomePageList),
    SearchPage(),
    Admin()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.barcode),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.listAlt),
            title: Text('Participants'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.addressCard),
            title: Text('About'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
