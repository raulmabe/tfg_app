import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/models/enums/activity_level.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/enums/dog_size.dart';
import 'package:jumpets_app/ui/components/buttons/flat_button.dart';
import 'package:jumpets_app/ui/components/buttons/sex_radio_button.dart';
import 'package:jumpets_app/ui/components/buttons/text_radio_button.dart';
import 'package:jumpets_app/ui/helper.dart';

class FiltersPage extends StatefulWidget {
  final ScrollController scrollController;

  final Category category;
  final String text;
  final List<DeliveryStatus> deliveryInfo;
  final ActivityLevel activityLevel;
  final DogSize size;
  final bool male;
  final bool focused;
  FiltersPage(
      {this.scrollController,
      this.category,
      this.text,
      this.deliveryInfo,
      this.activityLevel,
      this.size,
      this.male,
      this.focused = false})
      : assert(category != null),
        assert(category != Category.SHELTERS),
        assert(category != Category.SERVICES),
        assert(category != Category.PRODUCTS);
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  FiltersModel model;

  TextEditingController _textController;
  FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    model = FiltersModel(
      text: widget.text,
      size: widget.category == Category.DOGS ? widget.size : null,
      activityLevel: widget.activityLevel,
      male: widget.male,
      category: widget.category,
      deliveryStatuses: widget.deliveryInfo ?? [],
    );

    _textController = TextEditingController(text: widget.text);
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              pinned: true,
              leading: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    if (context.bloc<AdsBloc>().searchMode) {
                      context.bloc<AdsBloc>()
                        ..add(SearchModeDisabled())
                        ..add(AdsFetched());
                    }
                    Navigator.pop(context);
                  }),
              iconTheme:
                  Theme.of(context).iconTheme.copyWith(color: Colors.grey),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 2.0,
              title: Text(
                AppLocalizations.of(context).translate('filters'),
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              actions: [
                MyFlatButton(
                    onTap: () {
                      context.bloc<AdsBloc>().add(AdsSearched(
                          activityLevel: model.activityLevel,
                          text: model.text,
                          deliveryInfo: model.deliveryStatuses.isEmpty
                              ? null
                              : model.deliveryStatuses,
                          size: model.size,
                          male: model.male));
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context).translate('done'),
                        style: Theme.of(context).textTheme.button))
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _textRow(),
                    Divider(),
                    _categoryRow(),
                    Divider(),
                    _sexRow(),
                    _sizeRow(),
                    Divider(),
                    _deliveryInfoRow(),
                    Divider(),
                    _activityLevelRow(),
                    SizedBox(
                      height: kToolbarHeight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(String text, context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _categoryRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _header(AppLocalizations.of(context).translate('category'), context),
        Spacer(),
        Icon(
          model.category.getIcon(),
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget _sexRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _header(AppLocalizations.of(context).translate('sex'), context),
        Spacer(),
        SexRadioButton(
          male: true,
          isSelected: model.male ?? false,
          onTap: () => setState(() {
            if (model.male ?? false) {
              model.male = null;
            } else {
              model.male = true;
            }
          }),
        ),
        SexRadioButton(
          male: false,
          isSelected: !(model.male ?? true),
          onTap: () => setState(() {
            if (!(model.male ?? true)) {
              model.male = null;
            } else {
              model.male = false;
            }
          }),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget _textRow() {
    if (widget.focused) {
      FocusScope.of(context).requestFocus(focusNode);
    }
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey.shade800,
          ),
          onPressed: () => print('search'),
        ),
        Expanded(
          child: TextField(
            focusNode: focusNode,
            controller: _textController,
            onChanged: (value) => setState(() {
              if (value.isEmpty) value = null;
              model.text = value?.trim();
            }),
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                labelStyle: TextStyle(color: Colors.black)),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget _sizeRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        (model.category == Category.DOGS) ? Divider() : Container(),
        (model.category == Category.DOGS)
            ? _header(AppLocalizations.of(context).translate('size'), context)
            : Container(),
        (model.category == Category.DOGS)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: DogSize.values
                    .map((dogSize) => TextRadioButton(
                        text: AppLocalizations.of(context).translate(
                            'dog_size_${dogSize.name.toLowerCase()}'),
                        isSelected: model.size == dogSize,
                        onTap: () => setState(() {
                              model.size == dogSize
                                  ? model.size = null
                                  : model.size = dogSize;
                            })))
                    .toList())
            : Container(),
      ],
    );
  }

  Widget _deliveryInfoRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _header(
                '${AppLocalizations.of(context).translate('delivery_info')} (${model.deliveryStatuses.length})',
                context),
            MyFlatButton(
              onTap: () => setState(() {
                if (model.deliveryStatuses.length !=
                    DeliveryStatus.values.toList().length) {
                  model.deliveryStatuses = [];
                  model.deliveryStatuses.addAll(DeliveryStatus.values.toList());
                } else {
                  model.deliveryStatuses = [];
                }
              }),
              child: Text(
                  model.deliveryStatuses.length ==
                          DeliveryStatus.values.toList().length
                      ? AppLocalizations.of(context)
                          .translate('clear')
                          .toLowerCase()
                      : AppLocalizations.of(context)
                          .translate('all')
                          .toLowerCase(),
                  style: Theme.of(context).textTheme.button),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: DeliveryStatus.values
                  .map((deliveryStatus) => TextRadioButton(
                      text: AppLocalizations.of(context)
                          .translate(deliveryStatus.name.toLowerCase()),
                      isSelected:
                          model.deliveryStatuses.contains(deliveryStatus),
                      onTap: () => setState(() {
                            if (!model.deliveryStatuses
                                .contains(deliveryStatus)) {
                              model.deliveryStatuses.add(deliveryStatus);
                            } else {
                              model.deliveryStatuses.remove(deliveryStatus);
                            }
                          })))
                  .toList()),
        ),
      ],
    );
  }

  Widget _activityLevelRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _header(
            AppLocalizations.of(context).translate('activity_level'), context),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ActivityLevel.values
                .map((activityLevel) => TextRadioButton(
                    text: AppLocalizations.of(context).translate(
                        'activity_level_${activityLevel.name.toLowerCase()}'),
                    isSelected: model.activityLevel == activityLevel,
                    onTap: () => setState(() {
                          model.activityLevel == activityLevel
                              ? model.activityLevel = null
                              : model.activityLevel = activityLevel;
                        })))
                .toList()),
      ],
    );
  }
}

class FiltersModel {
  String text;
  bool male;
  DogSize size;
  Category category;
  ActivityLevel activityLevel;
  List<DeliveryStatus> deliveryStatuses;
  FiltersModel({
    this.text,
    this.male,
    this.size,
    this.category,
    this.activityLevel,
    this.deliveryStatuses,
  }) : assert(deliveryStatuses != null);
}
