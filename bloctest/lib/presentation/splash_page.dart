import 'package:bloctest/application/auth/auth_cubit.dart';
import 'package:bloctest/domain/auth/i_auth_facade.dart';
import 'package:bloctest/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoggedIn) {
          Navigator.pushNamed(context, '/');
        } else if (state is NotLoggedIn) {
          Navigator.pushNamed(context, '/loginpage'); 
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
