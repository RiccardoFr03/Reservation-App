// ignore_for_file: unused_local_variable, unused_catch_clause

import 'package:cloud_craft_solution/data/repositories/auth_repository.dart';
import 'package:cloud_craft_solution/domain/local_auth.config.dart';
import 'package:cloud_craft_solution/domain/oauth_config.dart';
import 'package:cloud_craft_solution/ui/screens/login_screen.dart';
import 'package:cloud_craft_solution/ui/screens/register_screen.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/widgets/elevated_button.dart';
import 'package:cloud_craft_solution/ui/widgets/microsoft_card.dart';
import 'package:cloud_craft_solution/ui/widgets/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

enum SupportState {
  unknown,
  supported,
  unSupported,
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Future<bool> faceId;
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  List<BiometricType>? availableBiometrics;
  @override
  void initState() {
    faceId = LoacalAuthConfig.getAuth();
    auth.isDeviceSupported().then((bool isSupported) => setState(() =>
        supportState =
            isSupported ? SupportState.supported : SupportState.unSupported));
    super.initState();
    checkBiometric();
    getAvailableBiometrics();
    OauthConfig.aadOAuth.hasCachedAccountInformation.then((value) {});
    OauthConfig.aadOAuth.getAccessToken().then((value) {});
  }

  Future<void> checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
      //    print("Biometric supported: $canCheckBiometric");
    } on PlatformException catch (e) {
      //  print(e);
      canCheckBiometric = false;
    }
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> biometricTypes;
    try {
      biometricTypes = await auth.getAvailableBiometrics();
      // print("supported biometrics $biometricTypes");
    } on PlatformException catch (e) {
      // print(e);
    }

    if (!mounted) {
      return;
    }
    setState(() {
      availableBiometrics = biometricTypes;
    });
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      final authenticated = await auth.authenticate(
          localizedReason: 'Authenticate with fingerprint or Face ID',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ));

      if (!mounted) {
        return;
      }

      if (authenticated) {
        _login();
      }
    } on PlatformException catch (e) {
      //  print(e);
      return;
    }
  }

  void _login() async {
    await AuthRepository.azureLogin().then((value) {
      AuthRepository.saveUser().then((value) => {
            Navigator.of(context).pushNamed(
              '/home',
            )
          });
    }).onError((e, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: faceId,
        builder: (context, snapshot) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(gradient: primayGradient),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 200.0),
                    child: Icon(
                      Icons.lock,
                      size: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'BENVENUTO!',
                    style: bold_36,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyOutlineButton(
                    name: 'LOGIN',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyElevatedButton(
                    textColor: Colors.white,
                    isGradinet: false,
                    name: 'REGISTER',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Visibility(
                    visible: snapshot.data ?? false,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.white)),
                          fixedSize: MaterialStatePropertyAll(
                            Size(320, 54),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: authenticateWithBiometrics,
                      child: const Text(
                        "Face ID",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      _login();
                    },
                    child: const MicrosoftCard(color: Colors.white),
                  )
                ],
              ),
            ),
          );
        });
  }
}
