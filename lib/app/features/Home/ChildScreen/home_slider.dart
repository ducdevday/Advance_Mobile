import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:advance_mobile/app/config/color.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class Banner {
  final String name;
  final String imageUrl;

  Banner({required this.name, required this.imageUrl});
}

class _HomeSliderState extends State<HomeSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Banner> banner_slider = [
    Banner(
        name: 'Banner 1',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shopfee-12b03.appspot.com/o/sample%2Fslide1.png?alt=media&token=fe374151-ece4-44df-a12b-4b8d0386fdbd'),
    Banner(
        name: 'Banner 2',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shopfee-12b03.appspot.com/o/sample%2Fslide2.png?alt=media&token=1a52560b-a9f8-4ae8-b569-a80511a8dbc2'),
    Banner(
        name: 'Banner 3',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shopfee-12b03.appspot.com/o/sample%2Fslide3.png?alt=media&token=6c1005ee-7d60-4ae8-b904-faadbd965b79'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            items: banner_slider
                .map((item) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Image.network(item.imageUrl,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width - 20)),
                    ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
              height: 137,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            )),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banner_slider.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? AppColor.primaryColor
                              : Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
