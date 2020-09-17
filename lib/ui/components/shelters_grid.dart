import 'package:flutter/material.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/cards/shelter_card.dart';
import 'package:jumpets_app/ui/components/placeholders/custom_content_placeholder.dart';

import 'maps/google_map_shelters.dart';

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
    _pageController = PageController(viewportFraction: 0.8);

    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 10,
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 350),
              child: widget.shelters != null && widget.shelters.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      /* borderRadius: BorderRadius.circular(32), */
                      child: MapAddress(
                        address: widget.shelters[_index].address,
                      ),
                    )
                  : Container()),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) => setState(() {
                      _index = index;
                    }),
                controller: _pageController,
                itemCount: widget.usePlaceholders ? 1 : widget.shelters.length,
                itemBuilder: (context, index) => Transform.scale(
                      scale: index == _index ? 1 : .9,
                      child: widget.usePlaceholders
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                ContentPlaceholder(
                                  height: 100,
                                ),
                                Spacer()
                              ],
                            )
                          : ShelterCard(
                              shelter: widget.shelters[index],
                              isSelected: index == _index,
                              offset: pageOffset - index,
                            ),
                    )),
          ),
        ),
      ],
    );
  }
}
