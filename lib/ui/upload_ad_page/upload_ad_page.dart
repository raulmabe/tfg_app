import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/blocs/upload_ad_bloc/upload_ad_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/buttons/category_button.dart';

import 'forms.dart';

class UploadAdPage extends StatefulWidget {
  @override
  _UploadAdPageState createState() => _UploadAdPageState();
}

class _UploadAdPageState extends State<UploadAdPage> {
  UploadAdBloc uploadAdBloc;

  double horizontalPadding = 20;

  @override
  void initState() {
    super.initState();

    uploadAdBloc = UploadAdBloc(
      repository: RepositoryProvider.of<AdsRepository>(context),
      authBloc: context.bloc<AuthBloc>(),
      errorBloc: context.bloc<ErrorHandlerBloc>(),
      infoBloc: context.bloc<InfoHandlerBloc>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadAdBloc>(
      create: (context) => uploadAdBloc,
      child: BlocConsumer<UploadAdBloc, UploadAdState>(
          listenWhen: (previous, current) =>
              current.status == FormzStatus.submissionSuccess &&
              current.ad != null,
          listener: (context, state) =>
              Navigator.popAndPushNamed(context, '/ad', arguments: state.ad),
          buildWhen: (previous, current) =>
              previous.category != current.category,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                leading: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => Navigator.pop(context)),
              ),
              body: ListView(
                children: [
                  Padding(
                      padding: EdgeInsets.all(8.0 + horizontalPadding),
                      child: Text(
                        '${AppLocalizations.of(context).translate('upload_your_ad_to')} ${AppLocalizations.of(context).translate(state.category.name.toLowerCase()).toLowerCase()}',
                        style: Theme.of(context).textTheme.headline6,
                      )),
                  SelectableCategories(),
                ]..add(_inputs(context)),
              ),
              bottomNavigationBar: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: UploadButton(),
              )),
            );
          }),
    );
  }

  Widget _inputs(context) {
    List<Widget> children = [];

    if (uploadAdBloc.state.category.isAnimal) children = _animalInputs(context);
    if (uploadAdBloc.state.category.isService)
      children = _serviceInputs(context);
    if (uploadAdBloc.state.category.isProduct)
      children = _productInputs(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: children,
      ),
    );
  }

  List<Widget> _animalInputs(context) => [
        AdNameInput(),
        AdBreedInput(),
        AdDescriptionInput(),
        AdMustKnowInput(),
        AdAdoptionTaxInput(),
        AdWeightInput(),
        AdBirthDate(),
        AdSexInput(),
        if (uploadAdBloc.state.category == Category.DOGS) AdDogSizeInput(),
        AdActivityLevelInput(),
        AdDeliveryInfoInput(),
        AdPersonalityInput(),
        AdTagsInput(),
        AdPhotosInput()
      ];

  List<Widget> _serviceInputs(context) => [
        AdTitleInput(),
        AdDescriptionInput(),
        AdPriceInput(
          isPriceHour: true,
        ),
        AdTagsInput(),
        AdPhotosInput()
      ];

  List<Widget> _productInputs(context) => [
        AdTitleInput(),
        AdDescriptionInput(),
        AdPriceInput(
          isPriceHour: false,
        ),
        AdTagsInput(),
        AdPhotosInput()
      ];
}

class SelectableCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.values.toList();
    categories.removeWhere((element) =>
        !(element.isAnimal || element.isProduct || element.isService));

    if (context.bloc<AuthBloc>().state.authStatus.authData.user.isParticular) {
      categories
          .removeWhere((element) => !(element.isAnimal || element.isService));
    } else if (context
        .bloc<AuthBloc>()
        .state
        .authStatus
        .authData
        .user
        .isProfesional) {
      categories
          .removeWhere((element) => !(element.isProduct || element.isService));
    } else if (context
        .bloc<AuthBloc>()
        .state
        .authStatus
        .authData
        .user
        .isProtectora) {
      categories.removeWhere((element) => !element.isAnimal);
    }

    return BlocBuilder<UploadAdBloc, UploadAdState>(
      buildWhen: (previous, current) => previous.category != current.category,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories
                .toList()
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: CategoryButton.fromCategory(
                        isSelected: state.category == category,
                        category: category,
                        size: 45,
                        isCollapsed: true,
                        borderRadius: 10,
                        onTap: (category) => context
                            .bloc<UploadAdBloc>()
                            .add(AdCategoryChanged(category)),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
