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
  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
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
              return widget.usePlaceholders
                  ? ContentPlaceholder(
                      height: 10,
                      width: 50,
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 8, left: 8),
                      child: Text(msg,
                          style: Theme.of(context).textTheme.subtitle1));
            },
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) => setState(() {
                        _index = index;
                      }),
                  controller: PageController(viewportFraction: 0.7),
                  itemBuilder: (context, index) => Transform.scale(
                        scale: index == _index ? 1 : .8,
                        child: widget.usePlaceholders
                            ? ContentPlaceholder(
                                height: 260,
                              )
                            : ShelterCard(
                                height: 260,
                                shelter: widget.shelters[index],
                                isSelected: index == _index,
                              ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
