import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class IAuthFacade {
  Option<User> getSignedInUser();
  Future<Either<String, Unit>> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<String, Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future signOut();
}
