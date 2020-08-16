import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';

class ValuationCard extends StatelessWidget {
  final Valuation valuation;
  ValuationCard(this.valuation);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileIcon(
          user: valuation.author,
          radius: 35,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  /* padding: EdgeInsets.symmetric(vertical: 10), */
                  child: valuation.valuationsStars()),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                    text: TextSpan(
                        text: valuation.author.name,
                        style: Theme.of(context).textTheme.headline6,
                        children: [
                      TextSpan(
                          text:
                              ' ${valuation.createdAt.timeago(locale: AppLocalizations.of(context).locale.languageCode)}',
                          style: Theme.of(context).textTheme.subtitle2),
                    ])),
              ),
              Container(child: Text(valuation.comment)),
            ],
          ),
        )),
      ],
    );
  }
}
