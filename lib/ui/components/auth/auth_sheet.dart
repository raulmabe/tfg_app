import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/bloc/login_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/bloc/register_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/models/enums/user_types.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';
import 'package:jumpets_app/ui/components/forms/login_form_components.dart';

// ! AuthSheet solo es un wrapper
class AuthSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .7,
        minChildSize: .7,
        maxChildSize: .9,
        expand: false,
        builder: (_, scrollController) => BlocListener<AuthBloc, AuthState>(
              listenWhen: (previous, current) =>
                  previous.authStatus != current.authStatus,
              listener: (context, state) {
                if (state.authStatus.status ==
                    AuthenticationStatus.authenticated) {
                  Navigator.pop(context);
                }
              },
              child: SafeArea(
                child: AuthBody(controller: scrollController),
              ),
            ));
  }
}

// * AuthBody es el widget principal de la AUTH
class AuthBody extends StatefulWidget {
  final bool notScrollable;
  final ScrollController controller;
  AuthBody({this.notScrollable = false, this.controller});
  @override
  _AuthBodyState createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  List<Widget> steps;
  int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    steps = [
      Step1Body(
          notScrollable: widget.notScrollable,
          onNext: () => setState(() {
                index++;
              }),
          controller: widget.controller),
      Step2Body(
          notScrollable: widget.notScrollable,
          onBack: () => setState(() {
                index--;
              }),
          onNext: () => setState(() {
                index++;
              }),
          controller: widget.controller),
      Step3Body(
          notScrollable: widget.notScrollable,
          onBack: () => setState(() {
                index--;
              }),
          controller: widget.controller),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
                errorBloc: context.bloc<ErrorHandlerBloc>()),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
                errorBloc: context.bloc<ErrorHandlerBloc>()),
          )
        ],
        child: AnimatedSwitcher(
            reverseDuration: Duration(milliseconds: 250),
            duration: Duration(milliseconds: 250),
            child: steps[index]));
  }
}

class Step1Body extends StatelessWidget {
  final bool notScrollable;
  final VoidCallback onNext;
  final ScrollController controller;
  Step1Body({this.notScrollable = false, this.onNext, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Center(
        child: SingleChildScrollView(
          controller: controller,
          physics: notScrollable
              ? NeverScrollableScrollPhysics()
              : ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              _Header(
                title: AppLocalizations.of(context).translate('welcome'),
                imagePath: 'assets/img/pollo3.png',
              ),
              LoginEmailInput(),
              LoginPasswordInput(),
              LoginButton(),
              SizedBox(height: 50),
              Text(
                AppLocalizations.of(context).translate('not_a_member_yet'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              MyRaisedButton(
                  text: AppLocalizations.of(context).translate('join_jumpets'),
                  filled: false,
                  color: Theme.of(context).accentColor,
                  onPressed: onNext),
              SizedBox(height: 50),
              SizedBox(
                height: kToolbarHeight * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Step2Body extends StatelessWidget {
  final bool notScrollable;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final ScrollController controller;
  Step2Body(
      {this.notScrollable = false, this.onBack, this.onNext, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Center(
        child: SingleChildScrollView(
          physics: notScrollable
              ? NeverScrollableScrollPhysics()
              : ClampingScrollPhysics(),
          controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              _Header(
                title: AppLocalizations.of(context).translate('your_data'),
                imagePath: 'assets/img/pollo1.png',
              ),
              RegisterNameInput(),
              RegisterEmailInput(),
              RegisterPasswordInput(),
              RegisterPasswordInput(isConfirmed: true),
              RegisterStep2Button(
                onTap: onNext,
              ),
              SizedBox(height: 50),
              Text(
                AppLocalizations.of(context)
                    .translate('you_can_modify_it_later_on_your_profile'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              MyRaisedButton(
                text: AppLocalizations.of(context).translate('go_back'),
                filled: false,
                borders: false,
                color: Theme.of(context).accentColor,
                onPressed: onBack,
              ),
              SizedBox(height: 50),
              SizedBox(
                height: kToolbarHeight * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Step3Body extends StatelessWidget {
  final bool notScrollable;
  final ScrollController controller;
  final VoidCallback onBack;
  Step3Body({this.notScrollable = false, this.onBack, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Center(
        child: SingleChildScrollView(
          physics: notScrollable
              ? NeverScrollableScrollPhysics()
              : ClampingScrollPhysics(),
          controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              _Header(
                title: AppLocalizations.of(context).translate('one_more_step'),
                imagePath: 'assets/img/pollo2.png',
              ),
              RegisterButton(
                title: AppLocalizations.of(context)
                    .translate('continue_like_a_private'),
                type: UserType.PARTICULAR,
              ),
              Text(
                AppLocalizations.of(context).translate('register_msg_private'),
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
              ),
              RegisterButton(
                title: AppLocalizations.of(context)
                    .translate('continue_like_a_professional'),
                type: UserType.PROFESIONAL,
              ),
              Text(
                AppLocalizations.of(context)
                    .translate('register_msg_professional'),
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
              ),
              RegisterButton(
                title: AppLocalizations.of(context)
                    .translate('continue_like_a_shelter'),
                type: UserType.PROTECTORA,
              ),
              Text(
                AppLocalizations.of(context).translate('register_msg_shelter'),
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
              ),
              SizedBox(height: 50),
              MyRaisedButton(
                text: AppLocalizations.of(context).translate('go_back'),
                filled: false,
                borders: false,
                color: Theme.of(context).accentColor,
                onPressed: onBack,
              ),
              SizedBox(height: 50),
              SizedBox(
                height: kToolbarHeight * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final String imagePath;
  _Header({@required this.title, @required this.imagePath})
      : assert(title != null),
        assert(imagePath != null);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            height: 70,
          ),
        ),
      ],
    );
  }
}
