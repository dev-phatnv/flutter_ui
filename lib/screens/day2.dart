import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_v2/helpers/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  int totalPage = 4;
  PageController _pageController;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage, 
        duration: Duration(milliseconds: 350), 
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(
            page: 1,
            image: 'assets/images/five.jpg',
            title: 'Title 01',
            description: 'Morbi a tincidunt magna. Pellentesque ullamcorper iaculis dignissim. Mauris accumsan suscipit turpis, at finibus ante ullamcorper in. Pellentesque sed accumsan nibh. Vivamus in erat cursus, mollis nulla vel, iaculis quam.'
          ),
          makePage(
            page: 2,
            image: 'assets/images/six.jpg',
            title: 'Title 02',
            description: 'Proin sit amet elit sed augue egestas auctor in quis turpis. Vivamus porttitor leo venenatis, viverra tellus ac, accumsan odio. Mauris accumsan suscipit turpis, at finibus ante ullamcorper in. Pellentesque sed accumsan nibh. Vivamus in erat cursus, mollis nulla vel, iaculis quam.'
          ),
          makePage(
            page: 3,
            image: 'assets/images/seven.jpg',
            title: 'Title 03',
            description: 'Maecenas maximus volutpat orci, id dignissim sem vehicula vitae. Proin vitae mollis nunc. Donec commodo imperdiet est convallis efficitur. Mauris accumsan suscipit turpis, at finibus ante ullamcorper in. Pellentesque sed accumsan nibh. Vivamus in erat cursus, mollis nulla vel, iaculis quam.'
          ),
          makePage(
            page: 4,
            image: 'assets/images/eight.jpg',
            title: 'Title 04',
            description: 'Curabitur interdum nunc libero, sed dictum nisl dictum dictum. Praesent elit lectus, luctus sit amet lorem nec, congue egestas lacus. Mauris accumsan suscipit turpis, at finibus ante ullamcorper in. Pellentesque sed accumsan nibh. Vivamus in erat cursus, mollis nulla vel, iaculis quam.'
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
            .3,
            .9
          ], colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    page.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/' + totalPage.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(1, Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),),
                  SizedBox(height: 20),
                  FadeAnimation(1.5, Row(children: [
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow, size: 15),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow, size: 15),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow, size: 15),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow, size: 15),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(Icons.star, color: Colors.grey, size: 15),
                    ),
                    Text('4.0', style: TextStyle(color: Colors.white70,),),
                    Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),),
                  ],), ),
                  SizedBox(height: 20),
                  FadeAnimation(2,  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15,),),
                  )),
                  SizedBox(height: 20),
                  FadeAnimation(2.5, Text('READ MORE', style: TextStyle(color: Colors.white)),),
                  SizedBox(height: 50),
                  RaisedButton(
                    child: Text('Open Flutter HomePage'),
                    onPressed: () {
                      
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
