import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/presentation/widget/tf_custom_widget.dart';
import 'package:my_story_app/presentation/widget/toast_widget.dart';
import 'package:my_story_app/routes.dart';

import '../bloc/user_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? _obscureText = true;

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<UserBloc>().add(
            UserRegister(
              name: _nameController.text,
              email: _emailController.text,
              username: _usernameController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsAssets.primary,
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.main, (route) => false);
          } else if (state is RegisterFailure) {
            toastWidget(
              color: ColorsAssets.failed,
              textColor: ColorsAssets.white,
              message: state.message,
            );
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                alignment: Alignment.center,
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
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 40,
                          color: ColorsAssets.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Create an account to continue',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorsAssets.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 280),
                      TfCustomWidget(
                        nameController: _emailController,
                        height: 80,
                        text: 'Email',
                        inputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TfCustomWidget(
                        nameController: _nameController,
                        height: 80,
                        text: 'Name',
                        inputType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TfCustomWidget(
                        nameController: _usernameController,
                        height: 80,
                        text: 'Username',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TfCustomWidget(
                        nameController: _passwordController,
                        height: 80,
                        text: 'Password',
                        inputType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText == true
                                ? FluentIcons.eye_16_filled
                                : FluentIcons.eye_off_16_filled,
                            color: ColorsAssets.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText!;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is RegisterLoading) {
                            return const CircularProgressIndicator();
                          }
                          return ElevatedButton(
                            onPressed: _onRegister,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Register'),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: ColorsAssets.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
