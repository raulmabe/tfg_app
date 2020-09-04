import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';

// https://undraw.co/illustrations

class BaseSpace extends StatelessWidget {
  final String assetName;
  final String titleUntranslated;
  final String subtitleUntranslated;
  final bool greyScale;

  BaseSpace(
      {@required this.assetName,
      @required this.titleUntranslated,
      @required this.subtitleUntranslated,
      this.greyScale = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (!greyScale)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: FractionallySizedBox(
              widthFactor: .8,
              child: Image.asset(
                assetName,
              ),
            ),
          ),
        if (greyScale)
          ColorFiltered(
            colorFilter: ColorFilter.matrix(<double>[
              0.2126,
              0.7152,
              0.0722,
              0,
              0,
              0.2126,
              0.7152,
              0.0722,
              0,
              0,
              0.2126,
              0.7152,
              0.0722,
              0,
              0,
              0,
              0,
              0,
              1,
              0,
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: FractionallySizedBox(
                widthFactor: .8,
                child: Image.asset(
                  assetName,
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(AppLocalizations.of(context).translate(titleUntranslated),
              style: Theme.of(context).textTheme.headline6),
        ),
        Text(AppLocalizations.of(context).translate(subtitleUntranslated),
            style: Theme.of(context).textTheme.caption)
      ],
    );
  }
}

class EmptySpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseSpace(
        assetName: 'assets/img/empty_background.png',
        titleUntranslated: 'empty_space_title',
        subtitleUntranslated: 'empty_space_subtitle');
  }
}

class NotFoundSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseSpace(
        assetName: 'assets/img/404.png',
        titleUntranslated: 'page_not_found_title',
        subtitleUntranslated: 'page_not_found_msg');
  }
}
