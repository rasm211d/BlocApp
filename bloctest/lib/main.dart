import 'package:bloctest/application/auth/auth_cubit.dart';
import 'package:bloctest/domain/auth/i_auth_facade.dart';
import 'package:bloctest/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'presentation/login_page.dart';
import 'presentation/splash_page.dart';

Future<void> main() async {
  configureInjection(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..isLoggedIn(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/loginpage': (context) => LoginPage(),
          //'/registerpage' : (context) => RegisterPage(),
          //'/profilepage' : (context) => ,
        },
      ),
    );
  }
}
