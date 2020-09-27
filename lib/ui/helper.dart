import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/models/enums/user_types.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/auth/auth_sheet.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import 'package:jumpets_app/ui/components/social_media_sheet.dart';
import 'package:jumpets_app/ui/filters_page/filters_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static void showFilterBottomSheet(
    BuildContext context, {
    Category category,
    String text,
    ActivityLevel activityLevel,
    List<DeliveryStatus> deliveryInfo,
    DogSize size,
    bool male,
  }) {
    showModalBottomSheet(
        barrierColor: Colors.black26,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        isScrollControlled: true,
        context: context,
        builder: (_) => DraggableScrollableSheet(
            initialChildSize: .7,
            maxChildSize: .95,
            expand: false,
            builder: (context, scrollController) => Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: FiltersPage(
                    category: category,
                    text: text,
                    activityLevel: activityLevel,
                    deliveryInfo: deliveryInfo,
                    male: male,
                    size: size,
                    scrollController: scrollController,
                  ),
                )));
  }

  static void showCameraOptions(BuildContext context,
      {Function() onCamera, Function() onGallery}) {
    showModalBottomSheet(
        barrierColor: Colors.black26,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        isScrollControlled: true,
        context: context,
        builder: (_) => BottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            )),
            onClosing: () {},
            builder: (context) => Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                )),
                color: Theme.of(context).primaryColor,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(JumpetsIcons.camara),
                                  onPressed: () {
                                    onCamera();
                                    Navigator.pop(context);
                                  }),
                              Text(AppLocalizations.of(context)
                                  .translate('camera'))
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.photo),
                                  onPressed: () {
                                    onGallery();
                                    Navigator.pop(context);
                                  }),
                              Text(AppLocalizations.of(context)
                                  .translate('gallery'))
                            ],
                          ),
                        ]),
                  ),
                ))));
  }

  static void showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
        barrierColor: Colors.black26,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AuthSheet()));
  }

  static void showSocialMediaBottomSheet(BuildContext context) {
    showModalBottomSheet(
        barrierColor: Colors.black26,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        context: context,
        builder: (_) => BottomSheet(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
            onClosing: () => true,
            builder: (context) => SocialMediaSheet()));
  }

  static Color getUserColorByType(UserType type) {
    var dummyUser;
    switch (type) {
      case UserType.PROTECTORA:
        dummyUser = Protectora((b) => b
          ..thumbnail = ''
          ..address = ''
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now()
          ..id = ''
          ..email = ''
          ..phone = 5
          ..name = '');
        return (dummyUser as Protectora).colorFromType;
      case UserType.PROFESIONAL:
        dummyUser = Profesional((b) => b
          ..thumbnail = ''
          ..address = ''
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now()
          ..id = ''
          ..email = ''
          ..phone = 5
          ..name = '');
        return (dummyUser as Profesional).colorFromType;
      case UserType.PROTECTORA:
      default:
        dummyUser = Particular((b) => b
          ..thumbnail = ''
          ..address = ''
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now()
          ..id = ''
          ..email = ''
          ..phone = 5
          ..name = '');
        return (dummyUser as Particular).colorFromType;
    }
  }

  static getGenderColor(BuildContext context, bool isMale) {
    return isMale ? Theme.of(context).accentColor : Color(0xffFDA7DF);
  }

  static getAnimalTypeFromCategory(Category category) {
    switch (category) {
      case Category.DOGS:
        return AnimalType.DOG;
      case Category.CATS:
        return AnimalType.CAT;
      case Category.FISHES:
        return AnimalType.FISH;
      case Category.REPTILES:
        return AnimalType.REPTILE;
      case Category.RODENTS:
        return AnimalType.RODENT;
      case Category.BUNNIES:
        return AnimalType.BUNNY;
      case Category.BIRDS:
        return AnimalType.BIRD;
      case Category.OTHERS:
        return AnimalType.OTHER;
      default:
        throw UnsupportedError('This category is not an animal');
    }
  }

  static String getFiltersStringFromEvent(
      BuildContext context, AdsSearched event) {
    String s = '';
    if (event.text != null) {
      s +=
          '${AppLocalizations.of(context).translate('text').toLowerCase()}:${event.text};';
    }
    if (event.male != null) {
      s +=
          '${AppLocalizations.of(context).translate('sex').toLowerCase()}:${event.male};';
    }

    if (event.deliveryInfo != null) {
      s +=
          '${AppLocalizations.of(context).translate('delivery_info').toLowerCase()}:${event.deliveryInfo};';
    }

    if (event.activityLevel != null) {
      s +=
          '${AppLocalizations.of(context).translate('activity_level').toLowerCase()}:${event.activityLevel};';
    }

    if (event.size != null) {
      s +=
          '${AppLocalizations.of(context).translate('size').toLowerCase()}:${event.size};';
    }
    return s;
  }
}
