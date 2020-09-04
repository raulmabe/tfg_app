import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/cards/shelter_card.dart';

class SheltersGrid extends StatefulWidget {
  final bool usePlaceholders;
  final List<Protectora> shelters;
  SheltersGrid({
    this.shelters,
    this.usePlaceholders = false,
  });
  @override
  _SheltersGridState createState() => _SheltersGridState();
}

class _SheltersGridState extends State<SheltersGrid> {
  int _index;
  double pageOffset = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _index = 0;
    _pageController = PageController(viewportFraction: 0.7);

    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              String msg;
              if (state.authStatus?.authData?.user?.address == null) {
                msg =
                    'Before searching for closest shelters you must first enter a valid address';
              } else {
                msg =
                    'Buscando desde "${state.authStatus.authData?.user?.address}"';
              }
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: widget.usePlaceholders
                      ? ContentPlaceholder(
                          borderRadius: 20,
                          height: 20,
                          width: 20,
                        )
                      : Container(
                          child: Text(msg,
                              style: Theme.of(context).textTheme.subtitle1)));
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: kToolbarHeight),
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) => setState(() {
                        _index = index;
                      }),
                  controller: _pageController,
                  itemCount:
                      widget.usePlaceholders ? 1 : widget.shelters.length,
                  itemBuilder: (context, index) => Transform.scale(
                        scale: index == _index ? 1 : .9,
                        child: widget.usePlaceholders
                            ? ContentPlaceholder()
                            : ShelterCard(
                                shelter: widget.shelters[index],
                                isSelected: index == _index,
                                offset: pageOffset - index,
                              ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
