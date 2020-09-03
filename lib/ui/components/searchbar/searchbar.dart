import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/ui/filters_page/filters_page.dart';
import 'package:jumpets_app/ui/helper.dart';

class SearchBar extends StatefulWidget {
  final Function onClear;
  final Function(String) onChange;
  SearchBar({this.onChange, this.onClear});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _textController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsBloc, AdsState>(
        listenWhen: (previous, current) => current is CategoryChanged,
        listener: (context, state) {
          FocusScope.of(context).unfocus();
          _textController.clear();
        },
        buildWhen: (prev, current) => current is SearchModeChanged,
        builder: (context, state) {
          return Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            color: Theme.of(context).backgroundColor,
            elevation: 0,
            child: Row(children: [
              AbsorbPointer(
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey.shade800,
                  ),
                  onPressed: () => print('search'),
                ),
              ),
              Expanded(
                child: AbsorbPointer(
                    absorbing: !context.bloc<AdsBloc>().isCategoryValidToSearch,
                    child: TextField(
                        controller: _textController,
                        onChanged: (value) {
                          if (widget.onChange != null) {
                            widget.onChange(value);
                          }
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: text(context)))),
              ),
              if (context.bloc<AdsBloc>().searchMode)
                IconButton(
                    color: Colors.black87,
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _textController.clear();

                      if (widget.onClear != null) widget.onClear();
                    })
            ]),
          );
        });
  }

  String text(BuildContext context) {
    if (!context.bloc<AdsBloc>().isCategoryValidToSearch)
      return AppLocalizations.of(context).translate('search_disabled');
    return context.bloc<AdsBloc>().searchMode
        ? Helper.getFiltersStringFromEvent(
            context, context.bloc<AdsBloc>().filters)
        : AppLocalizations.of(context).translate('search_bar_hint_text');
  }
}
