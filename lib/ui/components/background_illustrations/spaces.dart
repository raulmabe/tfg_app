import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';

// https://undraw.co/illustrations

class BaseSpace extends StatefulWidget {
  final String assetName;
  final String titleUntranslated;
  final String subtitleUntranslated;
  final bool greyScale;
  final double widthFactor;
  final Function retry;

  BaseSpace(
      {@required this.assetName,
      @required this.titleUntranslated,
      @required this.subtitleUntranslated,
      this.greyScale = true,
      this.widthFactor = 0.8,
      this.retry});

  @override
  _BaseSpaceState createState() => _BaseSpaceState();
}

class _BaseSpaceState extends State<BaseSpace> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(widget.assetName), context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!widget.greyScale) asset,
        if (widget.greyScale)
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
              child: asset),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            AppLocalizations.of(context).translate(widget.titleUntranslated),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        if (widget.retry != null)
          FractionallySizedBox(
            widthFactor: .5,
            child: MyRaisedButton(
              text: AppLocalizations.of(context)
                  .translate(widget.subtitleUntranslated),
              filled: false,
              borders: false,
              textColor: Theme.of(context).accentColor,
              onPressed: widget.retry,
            ),
          ),
        if (widget.retry == null)
          Text(
              AppLocalizations.of(context)
                  .translate(widget.subtitleUntranslated),
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center),
        SizedBox(
          height: kToolbarHeight * 1.3,
        ),
      ],
    );
  }

  Widget get asset => Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FractionallySizedBox(
          widthFactor: widget.widthFactor,
          child: Image.asset(
            widget.assetName,
          ),
        ),
      );
}

class EmptySpace extends StatelessWidget {
  final String msg;
  EmptySpace({this.msg});
  @override
  Widget build(BuildContext context) {
    return BaseSpace(
        assetName: 'assets/img/no_data.png',
        titleUntranslated: 'empty_space_title',
        widthFactor: .4,
        greyScale: false,
        subtitleUntranslated: msg ?? 'empty_space_subtitle');
  }
}

class NotFoundSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseSpace(
        widthFactor: .5,
        greyScale: false,
        assetName: 'assets/img/404.png',
        titleUntranslated: 'page_not_found_title',
        subtitleUntranslated: 'page_not_found_msg');
  }
}

class ErrorSpace extends StatelessWidget {
  final Function retry;
  final String msg;
  ErrorSpace({this.retry, this.msg});

  @override
  Widget build(BuildContext context) {
    return BaseSpace(
        widthFactor: .5,
        assetName: 'assets/img/ovni.png',
        greyScale: false,
        titleUntranslated: AppLocalizations.of(context).translate(msg) == null
            ? 'error_on_request_title'
            : msg,
        retry: retry,
        subtitleUntranslated: 'error_on_request_msg');
  }
}
