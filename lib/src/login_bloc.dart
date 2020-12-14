import 'package:login_prototype/src/auth_handler.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc {
  // ignore: unused_field
  String _username = '';
  // ignore: unused_field
  String _password = '';

  bool isPasswordHidden = true;
  bool isRememberMeToggled = false;

  final BehaviorSubject<bool> _canLogin = BehaviorSubject.seeded(false);

  Stream<bool> get canLogin => _canLogin.stream;

  void disableLogin() {
    _canLogin.sink.add(false);
  }

  void enableLogin() {
    _canLogin.sink.add(true);
  }

  void onPasswordChanged(final String password) {
    _password = password;
  }

  String validatePassword(final String password) {
    if (password.length < 4) {
      return 'password should be at lease 4 characters long';
    }

    return null;
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
  }

  void onUsernameChanged(final String username) {
    print(username);
    _username = username;
  }

  void submit() async {
    final authHandler = AuthHandler();
    await authHandler.changeLoginStatus();
  }

  String validateUsername(String username) {
    if (!username.contains('@')) {
      return 'username should contain @';
    }

    return null;
  }

  void toggleRememberMe() {
    isRememberMeToggled = !isRememberMeToggled;
  }

  onPasswordForgotten() {}

  void dispose() {
    _canLogin.close();
  }
}
