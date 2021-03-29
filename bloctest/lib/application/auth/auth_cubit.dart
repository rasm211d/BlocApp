import 'package:bloc/bloc.dart';
import 'package:bloctest/domain/auth/i_auth_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;
  AuthCubit(this._authFacade) : super(AuthInitial());

  isLoggedIn() {
    final user = _authFacade.getSignedInUser();

    if (user.isSome()) {
      emit(LoggedIn());
    } else if (user.isNone()) {
      emit(NotLoggedIn());
    }
  }
}
