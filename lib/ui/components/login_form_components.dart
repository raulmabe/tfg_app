import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/ui/components/raised_button.dart';
import 'package:formz/formz.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textfield'),
          onChanged: (email) =>
              context.bloc<AuthBloc>().add(AuthEmailChanged(email)),
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
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textfield'),
          onChanged: (password) =>
              context.bloc<AuthBloc>().add(AuthPasswordChanged(password)),
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
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.formStatus != current.formStatus,
      builder: (context, state) {
        return MyRaisedButton(
          onPressed: () => context.bloc<AuthBloc>().add(AuthLogInSubmitted()),
          text: 'accede',
          blocked: !state.formStatus.isValidated,
          child: state.formStatus.isSubmissionInProgress
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )
              : null,
        );
      },
    );
  }
}
