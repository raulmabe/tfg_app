import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/components/animated/page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final int selectedIndex;
  final List<String> imagesUrls;
  final Function(int) onChanged;
  ImageCarousel({this.selectedIndex, this.imagesUrls, this.onChanged})
      : assert(selectedIndex < imagesUrls.length && selectedIndex >= 0);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  void didUpdateWidget(oldWidget) {
    _pageController.animateToPage(widget.selectedIndex,
        duration: Duration(milliseconds: 350), curve: Curves.ease);
    super.didUpdateWidget(oldWidget);
  }

  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          physics: ClampingScrollPhysics(),
          controller: _pageController,
          onPageChanged: widget.onChanged,
          children: imagesUrls
              .map((url) => Image.network(
                    url,
                    fit: BoxFit.cover,
                  ))
              .toList(),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
                    colors: [Colors.transparent, Colors.black26],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
                .createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 50,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: PageIndicator(
                selectedColor: Theme.of(context).accentColor,
                unselectedColor: Colors.white,
                selectedIndex: selectedIndex,
                length: imagesUrls.length)),
      ],
    );
  }

  List<String> get imagesUrls => widget.imagesUrls;
  int get selectedIndex => widget.selectedIndex;
}
