import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/blocs/search_bloc/search_ads_bloc.dart'
    as independentSearchBloc;
import 'package:jumpets_app/blocs/valuations_bloc/valuations_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/users/user.dart';

import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:jumpets_app/ui/profile_page/profile_body.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({@required this.user}) : assert(user != null);
  @override
  _ProfilePageState createState() => _ProfilePageState(user);
}

class _ProfilePageState extends State<ProfilePage> {
  _ProfilePageState(this.user);
  User user;
  @override
  void initState() {
    super.initState();

    BlocProvider.of<independentSearchBloc.SearchAdsBloc>(context)
      ..add(independentSearchBloc.AdsSearched(creator: user.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<independentSearchBloc.SearchAdsBloc,
        independentSearchBloc.SearchAdsState>(
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => _build(
                context,
                state.authStatus.status.isAuthenticated &&
                    state.authStatus.authData.user.id == user.id));
      },
    );
  }

  Widget _build(BuildContext context, bool isMyProfile) {
    var actionsList = isMyProfile
        ? [
            IconButton(
                icon: Icon(FontAwesomeIcons.slidersH),
                iconSize: 22,
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                color: Colors.black54),
          ]
        : <Widget>[];

    return BlocProvider<ValuationsBloc>(
      create: (context) => ValuationsBloc(
          repository: RepositoryProvider.of<UserRepository>(context),
          authBloc: context.bloc<AuthBloc>()),
      child: BlocListener<ValuationsBloc, ValuationsState>(
          listenWhen: (previous, current) =>
              previous.status == FormzStatus.submissionInProgress &&
              current.status == FormzStatus.submissionSuccess &&
              current.user != null,
          listener: (context, state) {
            setState(() {
              user = state.user;
            });
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              title: Text(
                AppLocalizations.of(context)
                    .translate(user.stringFromType.toLowerCase()),
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: user.colorFromType),
              ),
              centerTitle: true,
              actions: actionsList,
              iconTheme:
                  Theme.of(context).iconTheme.copyWith(color: Colors.grey),
            ),
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RoundedRectProfileThumb(
                          borderRadius: 20,
                          height: 130,
                          width: 150,
                          borderWidth: 2,
                          user: user,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(user.name,
                                  style: Theme.of(context).textTheme.headline5),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: user.valuationsStars),
                              user.address != null
                                  ? SelectableText(
                                      user.address,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )
                                  : Container(),
                              user.phone != null
                                  ? SelectableText(
                                      user.phone.toString(),
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: ProfileBody(user: user)),
              ],
            ),
          )),
    );
  }

  bool get hasWeb =>
      (user.isProtectora && (user as Protectora).web != null) ||
      (user.isProfesional && (user as Profesional).web != null);
}
