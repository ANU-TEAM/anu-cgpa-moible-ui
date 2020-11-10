import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomeScreen extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          bool weCanCheckBiometrics = await localAuth.canCheckBiometrics;
          if (weCanCheckBiometrics) {
            bool authenticated = await localAuth.authenticateWithBiometrics(
                localizedReason: "Authenticate to see you CGPA.");
            print(authenticated);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.fingerprint,
              size: 124.0,
            ),
            Text(
              "Touch to Login",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
