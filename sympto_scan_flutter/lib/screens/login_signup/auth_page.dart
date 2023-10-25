import 'package:sympto_scan_flutter/screens/login_signup/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sympto_scan_flutter/screens/remedies/youtube_remedy.dart';
import 'package:sympto_scan_flutter/screens/symptoms/symptoms.dart';

import 'home_page.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // return VideoSuggestionsPage(
          //   query: 'hypertension',
          // );
          return Symptoms();
        } else {
          return LoginOrRegisterPage();
        }
      },
    ));
  }
}
