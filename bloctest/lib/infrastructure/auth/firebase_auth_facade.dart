import 'package:bloctest/domain/auth/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthFacade(this._firebaseAuth);

  @override
  Option<User> getSignedInUser() {
    return optionOf(_firebaseAuth.currentUser);
  }

  @override
  Future<Either<String, Unit>> registerWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      return right(unit);
    } on PlatformException catch (e) {
      return left(e.code);
    }
  }

  @override
  Future<Either<String, Unit>> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      return right(unit);
    } on PlatformException catch (e) {
      return left(e.code);
    }
  }

  @override
  Future signOut() async {
    Future.wait([_firebaseAuth.signOut()]);
  }
}
