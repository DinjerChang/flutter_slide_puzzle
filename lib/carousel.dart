import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  List<String> images = [
    'assets/images/howToPlay1.png',
    'assets/images/howToPlay2.png',
    'assets/images/howToPlay3.png',
    'assets/images/howToPlay4.png',
    'assets/images/howToPlay5.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    dynamic page = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: page.size.height * 0.062,
        iconTheme: IconThemeData(
          color: Color(0xff21325E),
        ),
        backgroundColor: Color(0xfffeb34c),
        title: Text('How to play',
            style: TextStyle(
                color: Color(0xff21325E), fontWeight: FontWeight.bold)),
      ),
      body: CarouselSlider(
        options: CarouselOptions(height: 800.0),
        items: [0, 1, 2, 3, 4].map((i) {
          return Builder(builder: (BuildContext context) {
            return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mobile-bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                constraints: BoxConstraints.expand(),
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(images[i], height: 700, width: 350),
                      )
                    ]));
          });
        }).toList(),
      ),
    );
  }
}
