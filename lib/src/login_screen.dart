import 'package:flutter/material.dart';
import 'package:login_prototype/src/login_bloc.dart';
import 'package:login_prototype/generated/l10n.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  _LoginScreenState();

  @override
  Widget build(BuildContext context) {
    return Provider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: Builder(
        builder: (context) {
          final bloc = Provider.of<LoginBloc>(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: _LoginLogo()),
                    SliverToBoxAdapter(
                      child: Form(
                        key: _loginFormKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        onChanged: () {
                          if (_loginFormKey.currentState.validate()) {
                            bloc.enableLogin();
                          } else {
                            bloc.disableLogin();
                          }
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            _UsernameField(bloc: bloc),
                            const SizedBox(height: 16),
                            _PasswordField(bloc: bloc),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          _LoginOptions(bloc: bloc),
                          _LoginButton(bloc),
                          const SizedBox(height: 16),
                          _TermsOfUseAndEula(),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _Copyright(),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoginLogo extends StatelessWidget {
  const _LoginLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Container(
      height: 150.0,
      decoration: BoxDecoration(border: Border.all(width: 2, color: color)),
      child: Center(child: Text('CX LOGO', style: TextStyle(color: color))),
    );
  }
}

class _UsernameField extends StatelessWidget {
  final LoginBloc bloc;

  const _UsernameField({@required this.bloc});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: bloc.onUsernameChanged,
      validator: bloc.validateUsername,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: S.of(context).usernameField,
        labelText: S.of(context).usernameField,
        isDense: true,
        contentPadding: EdgeInsets.all(14),
      ),
    );
  }
}

// Password field is stateful widget to isolate rebuild to only this widget.
class _PasswordField extends StatefulWidget {
  final LoginBloc bloc;

  _PasswordField({@required this.bloc});

  @override
  __PasswordFieldState createState() => __PasswordFieldState();
}

class __PasswordFieldState extends State<_PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.bloc.isPasswordHidden,
      onChanged: widget.bloc.onPasswordChanged,
      validator: widget.bloc.validatePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () {
            setState(() => widget.bloc.togglePasswordVisibility());
          },
        ),
        border: OutlineInputBorder(),
        hintText: S.of(context).passwordField,
        labelText: S.of(context).passwordField,
        isDense: true,
        contentPadding: EdgeInsets.all(14),
      ),
    );
  }
}

class _RememberMeCheckbox extends StatefulWidget {
  final LoginBloc bloc;

  const _RememberMeCheckbox(this.bloc);

  @override
  __RememberMeCheckboxState createState() => __RememberMeCheckboxState();
}

class __RememberMeCheckboxState extends State<_RememberMeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: Checkbox.width,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: widget.bloc.isRememberMeToggled,
            onChanged: (_) {
              setState(() => widget.bloc.toggleRememberMe());
            },
          ),
        ),
        SizedBox(width: 8),
        Text(S.of(context).rememberMeCheckbox),
      ],
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  final LoginBloc bloc;

  const _ForgotPasswordButton(this.bloc);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => bloc.onPasswordForgotten(),
      child: Text(S.of(context).forgotPassword),
    );
  }
}

class _LoginOptions extends StatelessWidget {
  final LoginBloc bloc;

  const _LoginOptions({this.bloc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _RememberMeCheckbox(bloc),
        _ForgotPasswordButton(bloc),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  final LoginBloc bloc;

  const _LoginButton(this.bloc);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context).colorScheme;
    final buttonStyle = ElevatedButton.styleFrom(
      primary: currentTheme.secondary,
      onPrimary: currentTheme.onSecondary,
      onSurface: currentTheme.onSurface,
    );

    return StreamBuilder<bool>(
      stream: bloc.canLogin,
      builder: (context, snapshot) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: buttonStyle,
            onPressed: snapshot.hasData && snapshot.data ? bloc.submit : null,
            child: Text(S.of(context).login),
          ),
        );
      },
    );
  }
}

class _TermsOfUseAndEula extends StatelessWidget {
  const _TermsOfUseAndEula();

  @override
  Widget build(BuildContext context) {
    final textOnBackgroundColor = Theme.of(context).colorScheme.onBackground;

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: S.of(context).licenseBySigningIn,
            style: TextStyle(color: textOnBackgroundColor),
          ),
          TextSpan(
            text: S.of(context).licenseTermsOfUse,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: S.of(context).licenseAnd,
            style: TextStyle(color: textOnBackgroundColor),
          ),
          TextSpan(
            text: S.of(context).licenseEULA,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: S.of(context).licenseEnding,
            style: TextStyle(color: textOnBackgroundColor),
          )
        ],
      ),
    );
  }
}

class _Copyright extends StatelessWidget {
  const _Copyright({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textOnBackgroundColor = Theme.of(context).colorScheme.onBackground;

    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Text(
        S.of(context).trademark,
        textAlign: TextAlign.center,
        style: TextStyle(color: textOnBackgroundColor),
      ),
    );
  }
}
