import 'package:cloud_craft_solution/ui/screens/welcome_screen.dart';
import 'package:cloud_craft_solution/ui/utils/validators.dart';
import 'package:cloud_craft_solution/ui/widgets/elevated_button.dart';
import 'package:cloud_craft_solution/ui/widgets/input_widget.dart';
import 'package:cloud_craft_solution/ui/widgets/login_register_header.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePwd = true;
  bool showLoader = false;
  final formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerSurname = TextEditingController();
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
                16, MediaQuery.of(context).size.height / 2.8, 16, 0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  InputWidget(
                    hint: 'Luca',
                    label: 'NOME:',
                    obscureText: false,
                    controller: controllerName,
                    icon: Icons.person,
                    onIconTap: () {},
                    validator: requiredValidator,
                    autoValidate: false,
                  ),
                  const SizedBox(height: 16),
                  InputWidget(
                    hint: 'Rossi',
                    label: 'COGNOME:',
                    obscureText: false,
                    controller: controllerSurname,
                    icon: Icons.person,
                    onIconTap: () {},
                    validator: requiredValidator,
                    autoValidate: false,
                  ),
                  const SizedBox(height: 16),
                  InputWidget(
                    hint: 'luca@gmail.com',
                    label: 'EMAIL:',
                    obscureText: false,
                    controller: controllerUsername,
                    icon: Icons.email,
                    onIconTap: () {},
                    validator: emailValidator,
                    autoValidate: true,
                  ),
                  const SizedBox(height: 16),
                  InputWidget(
                    label: "PASSWORD:",
                    hint: "Password",
                    icon: obscurePwd ? Icons.visibility : Icons.visibility_off,
                    obscureText: obscurePwd,
                    autoValidate: true,
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
                    textColor: Colors.black,
                    name: 'REGISTER',
                    onTap: () {
                      if (formKey.currentState?.validate() == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      }
                    },
                    isGradinet: true,
                  ),
                ],
              ),
            ),
          ),
          const LoginRegisterHeader(
            name: 'REGISTER',
          ),
        ],
      ),
    );
  }
}
