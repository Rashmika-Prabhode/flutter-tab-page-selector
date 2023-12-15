import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tab Page Selector',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          Center(
            child: Text('Page 1 Content'),
          ),
          Center(
            child: Text('Page 2 Content'),
          ),
          Center(
            child: Text('Page 3 Content'),
          ),
        ],
      ),
      bottomNavigationBar: _buildPageSelector(),
    );
  }

  Widget _buildPageSelector() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => _buildDot(index),
        ),
      ),
    );
  }

  Widget _buildDot(int pageIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndex == _currentPageIndex ? Colors.blue : Colors.grey,
      ),
    );
  }
}
