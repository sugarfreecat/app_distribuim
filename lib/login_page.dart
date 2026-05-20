import 'package:flutter/material.dart';
import 'components/elevated_button.dart';
import 'services/auth_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/web_only.dart' as web;


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      GoogleSignIn.instance.initialize(
        clientId: AuthService().getGoogleSignInClientId(),
      );

      GoogleSignIn.instance.authenticationEvents.listen((event) {
        if (event is GoogleSignInAuthenticationEventSignIn) {
          AuthService().signInWithGoogleAccount(event.user).catchError((error) {
            debugPrint('Web sign-in failed: $error');
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 86, 0),
      body: Center(
        child: kIsWeb
            ? SizedBox(
                width: 280,
                height: 50,
                child: web.renderButton(
                  configuration: web.GSIButtonConfiguration(
                    type: web.GSIButtonType.standard,
                    theme: web.GSIButtonTheme.outline,
                    text: web.GSIButtonText.signinWith,
                    shape: web.GSIButtonShape.rectangular,
                    locale: 'pt-BR',
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(onPressed: AuthService().signInWithGoogle),
                ],
              ),
      ),
    );
  }
}