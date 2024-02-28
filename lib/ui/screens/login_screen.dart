import 'package:cloud_craft_solution/ui/screens/my_bottom_nav_bar.dart';
import 'package:cloud_craft_solution/ui/utils/validators.dart';
import 'package:cloud_craft_solution/ui/widgets/elevated_button.dart';
import 'package:cloud_craft_solution/ui/widgets/input_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/login_register_header.dart';
import 'package:cloud_craft_solution/ui/widgets/microsoft_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePwd = true;
  bool showLoader = false;
  final formKey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                16, MediaQuery.of(context).size.height / 2.5, 16, 0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  InputWidget(
                    hint: 'luca@gmail.com',
                    label: 'EMAIL:',
                    obscureText: false,
                    controller: controllerUsername,
                    icon: Icons.email,
                    onIconTap: () {},
                    validator: emailValidator,
                    autoValidate: false,
                  ),
                  const SizedBox(height: 16),
                  InputWidget(
                    label: "PASSWORD:",
                    hint: "Password",
                    icon: obscurePwd ? Icons.visibility : Icons.visibility_off,
                    obscureText: obscurePwd,
                    autoValidate: false,
                    validator: passwordValidator,
                    controller: controllerPassword,
                    onIconTap: () => setState(() {
                      obscurePwd = !obscurePwd;
                    }),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyElevatedButton(
                    textColor: Colors.white,
                    isGradinet: true,
                    name: 'LOGIN',
                    onTap: () {
                      if (formKey.currentState?.validate() == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MyBottomNavBar(),
                          ),
                        );
                      }
                    },
                  ),
                  const Spacer(),
                  const MicrosoftCard(color: Colors.black)
                ],
              ),
            ),
          ),
          const LoginRegisterHeader(
            name: 'LOGIN',
          ),
        ],
      ),
    );
  }
}
