import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      }),
                    },
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }

                  final errors = <String>[];
                  if (value.length < 8) {
                    errors.add("At least 8 characters");
                  }
                  if (value.length > 16) {
                    errors.add('At most 16 characters');
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    errors.add('At least 1 uppercase letter');
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    errors.add('At least 1 lowercase letter');
                  }
                  if (!RegExp(r'\d').hasMatch(value)) {
                    errors.add('At least 1 number');
                  }
                  if (!RegExp(r'[!@#\$&9~.,;:()_\-+=<>?]').hasMatch(value)) {
                    errors.add('At least 1 special character');
                  }

                  if (errors.isEmpty) return null;

                  return errors.join('\n');
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => {
                  if (_formKey.currentState!.validate()) {context.go('/home')},
                },
                child: const Text('Register'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
