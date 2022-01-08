import 'package:anucgpa/screens/TabBarContainer.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomeScreen extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow[700],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Icon(
                  Icons.fingerprint,
                  size: 124.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: FlatButton(
                    highlightColor: Colors.yellow[900],
                    onPressed: () async {
                      bool canCheckBiometrics =
                          await localAuth.canCheckBiometrics;
                      if (canCheckBiometrics) {
                        bool authenticated = await localAuth.authenticate(
                            localizedReason: 'Please authenticate to view CGPA',
                            biometricOnly: true);

                        if (authenticated) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabBarContainer()));
                        }
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabBarContainer()));
                      }
                    },
                    height: 55,
                    color: Colors.yellow[800],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CLICK TO LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    // child: Text(
                    //   "Touch to Login",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Once you have authenticated. \n The App will not ask you to authenticate until you close the app completly.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
