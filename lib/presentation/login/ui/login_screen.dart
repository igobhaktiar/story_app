import 'package:flutter/material.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/presentation/widget/tf_custom_widget.dart';
import 'package:my_story_app/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsAssets.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsAssets.eerieBlack,
                    ColorsAssets.primary,
                  ],
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome',
                      style: TextStyle(
                        fontSize: 40,
                        color: ColorsAssets.white,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    'Login to continue',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsAssets.grey,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 320),
                    TfCustomWidget(
                      nameController: _usernameController,
                      text: 'Username',
                      height:
                          _formKey.currentState?.validate() == true ? 50 : 80,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TfCustomWidget(
                      nameController: _passwordController,
                      text: 'Password',
                      height:
                          _formKey.currentState?.validate() == true ? 50 : 80,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: ColorsAssets.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.register);
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: ColorsAssets.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
