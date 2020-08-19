import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/bloc/login_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/bloc/register_bloc.dart';
import 'package:jumpets_app/models/enums/user_types.dart';
import 'package:jumpets_app/ui/components/raised_button.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/ui/helper.dart';

class LoginEmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textfield'),
          onChanged: (email) =>
              context.bloc<LoginBloc>().add(LoginEmailChanged(email)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('email'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class LoginPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textfield'),
          onChanged: (password) =>
              context.bloc<LoginBloc>().add(LoginPasswordChanged(password)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              /*  suffixText: "Forgot your password?",
              suffixStyle: TextStyle(color: Colors.black54), */
              labelText: AppLocalizations.of(context).translate('password'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MyRaisedButton(
          onPressed: () => context.bloc<LoginBloc>().add(LoginLogInSubmitted()),
          text: AppLocalizations.of(context).translate('sign_in'),
          blocked: !state.status.isValidated,
          child: state.status.isSubmissionInProgress
              ? CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : null,
        );
      },
    );
  }
}

class RegisterNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          key: const Key('registerForm_nameInput_textfield'),
          onChanged: (name) =>
              context.bloc<RegisterBloc>().add(RegisterNameChanged(name)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('name'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class RegisterEmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('registerForm_emailInput_textfield'),
          onChanged: (email) =>
              context.bloc<RegisterBloc>().add(RegisterEmailChanged(email)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('email'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class RegisterPasswordInput extends StatelessWidget {
  final bool isConfirmed;
  RegisterPasswordInput({this.isConfirmed = false});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('registerForm_passwordInput_textfield'),
          onChanged: (password) => context.bloc<RegisterBloc>().add(isConfirmed
              ? RegisterSecondPasswordChanged(password)
              : RegisterPasswordChanged(password)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              /*  suffixText: "Forgot your password?",
              suffixStyle: TextStyle(color: Colors.black54), */
              labelText: AppLocalizations.of(context).translate('password'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class RegisterStep2Button extends StatelessWidget {
  final VoidCallback onTap;
  RegisterStep2Button({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MyRaisedButton(
          onPressed: onTap,
          text: AppLocalizations.of(context).translate('next'),
          blocked: !state.status.isValidated,
        );
      },
    );
  }
}

class RegisterButton extends StatelessWidget {
  final String title;
  final UserType type;
  RegisterButton({@required this.type, @required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MyRaisedButton(
          onPressed: () =>
              context.bloc<RegisterBloc>().add(RegisterSubmitted(type)),
          text: title,
          color: Helper.getUserColorByType(type),
          textColor: Colors.white,
          child: state.status.isSubmissionInProgress
              ? CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : null,
        );
      },
    );
  }
}
