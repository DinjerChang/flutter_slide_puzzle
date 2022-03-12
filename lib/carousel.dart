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
    'assets/images/1.png',
    'assets/images/1.png',
    'assets/images/1.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('How to play'),
      ),
      body: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: [0, 1, 2].map((i) {
          return Builder(builder: (BuildContext context) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.only(top: 50),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: Image.asset(images[i], height: 300, width: 300),
                  )
                ]);
          });
        }).toList(),
      ),
    );
  }
}
