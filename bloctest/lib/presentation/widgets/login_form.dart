import 'package:bloctest/domain/core/validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 40,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
              ),
              labelText: 'Email',
            ),
            autocorrect: false,
            onChanged: (value) => {
              email = value,
            },
            validator: (_) {
              if (!validateEmailAddress(email.toString())) {
                return 'Please enter a valid email';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
              ),
              labelText: 'Password',
            ),
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => {
              password = value,
            },
            validator: (_) {
              if (!validatePassword(password.toString())) {
                return 'Password must be longer than 6 chars';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              print('login pressed');
            },
            child: const Text('Sign in'),
          )
        ],
      ),
    );
  }
}
