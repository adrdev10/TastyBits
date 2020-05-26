import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tastybits/CameraWidget.dart';
import 'package:tastybits/RecipeWidget.dart';
import 'package:tastybits/ShoppingListWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => MyHomePage(),
        '/camera': (context) => CameraApp()
      },
      title: 'Flutter Demo',
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final PageController _pageController = PageController(
  initialPage: 0
);
var selectedPage;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedPage = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            selectedPage = index;
          });
    },
 
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_overscan),
        onPressed: () => {
            Navigator.pushNamed(context, '/camera')
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          Container(
            child: Text('First Screen')
          ),
          Container(
            child: ShoppingListWidget()
          ),
          Container(
            child: RecipeWidget(),
          ),
        ],
      ),
    );
  }
}
