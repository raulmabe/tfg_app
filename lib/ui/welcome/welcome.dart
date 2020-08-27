import 'package:flutter/material.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/buttons/category_button.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  ScrollController _scrollController;
  bool lastStatus = true;
  double height = 800, width;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (height - 200);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height / 1.1;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          stretch: true,
          expandedHeight: height,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
            centerTitle: !isShrink,
            titlePadding: EdgeInsets.all(0),
            title: SafeArea(
              child: Container(
                  height: height / 1.5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('PetsWorld',
                          style: TextStyle(
                              fontFamily: 'VelvetHeart',
                              color: Color(0xFF76DEC2),
                              fontSize: 55)),
                      !isShrink
                          ? Text('aqui empieza otra amistad',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontFamily: 'VelvetHeart', fontSize: 35))
                          : Container(),
                      !isShrink ? Spacer() : Container(),
                      !isShrink
                          ? Container(
                              width: width / 2,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                  child: Text(
                                      'Encuentra tu mascota entre protectoras y particulares',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15))))
                          : Container(),
                    ],
                  )),
            ),
            background: Image.asset(
              'assets/img/bebe.jpg',
              fit: BoxFit.cover,
              alignment: Alignment(-0.4, 0),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Explora las categorías',
                      style: TextStyle(
                          fontFamily: 'VelvetHeart',
                          color: Color(0xFF76DEC2),
                          fontSize: 60)),
                  GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: List.generate(
                          Category.values.length,
                          (index) => CategoryButton.fromCategory(
                              category: Category.values.toList()[index]))),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
