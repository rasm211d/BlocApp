part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class LoggedIn extends AuthState {
  const LoggedIn();
}

class NotLoggedIn extends AuthState {
  const NotLoggedIn();
}
