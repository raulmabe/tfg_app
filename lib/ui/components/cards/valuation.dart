import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';

class ValuationCard extends StatelessWidget {
  final Valuation valuation;
  ValuationCard(this.valuation);
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 85,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CircularProfileThumb(
                      user: valuation.author,
                      radius: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      valuation.author.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)
                            .translate(valuation.author.stringFromType),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      valuation.createdAt.timeago(
                          locale:
                              AppLocalizations.of(context).locale.languageCode),
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ]),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: valuation.valuationsStars(size: 17)),
                  Container(child: Text(valuation.comment)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
