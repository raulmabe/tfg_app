import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';

// https://undraw.co/illustrations

class BaseSpace extends StatelessWidget {
  final String assetName;
  final String titleUntranslated;
  final String subtitleUntranslated;
  final bool greyScale;
  final double widthFactor;

  BaseSpace(
      {@required this.assetName,
      @required this.titleUntranslated,
      @required this.subtitleUntranslated,
      this.greyScale = true,
      this.widthFactor = 0.8});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!greyScale)
          FractionallySizedBox(
            widthFactor: widthFactor,
            child: Image.asset(
              assetName,
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
            child: FractionallySizedBox(
              widthFactor: widthFactor,
              child: Image.asset(
                assetName,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            AppLocalizations.of(context).translate(titleUntranslated),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        Text(AppLocalizations.of(context).translate(subtitleUntranslated),
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center),
        SizedBox(
          height: kToolbarHeight * 1.3,
        ),
      ],
    );
  }
}

class EmptySpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseSpace(
        assetName: 'assets/img/no_data.png',
        titleUntranslated: 'empty_space_title',
        widthFactor: .4,
        greyScale: false,
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
