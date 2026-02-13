import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:chat_app/widgets/registrybottom.dart';
import 'package:flutter/material.dart';

class Login_signup extends StatefulWidget {
  Login_signup({
    super.key,

    required this.buttonText,
    required this.title,
    required this.textbutton,
    required this.subtitle,
    required this.onSubmit,
    required this.onPressed,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String buttonText;
  final String title;
  final String textbutton;
  final String subtitle;
  final void Function({required String email, required String password})
  onSubmit;
  final VoidCallback onPressed;
  @override
  State<Login_signup> createState() => _Login_signupState();
}

bool isPasswordVisible = true;
String? email;
String? password;

class _Login_signupState extends State<Login_signup> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              SizedBox(height: 170),
              Image.asset('assets/images/scholar.png', height: 100, width: 100),
              SizedBox(height: 20),
              const Text(
                'scholar chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 150),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Textfield1(
                prefixIcon: Icon(
                  Icons.email,
                  color: const Color.fromARGB(255, 22, 94, 170),
                ),
                obscureText: false,
                hintText: 'email',
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 20),
              Textfield1(
                prefixIcon: Icon(
                  Icons.lock,
                  color: const Color.fromARGB(255, 22, 94, 170),
                ),
                suffixIcon: isPasswordVisible
                    ? IconButton(
                        icon: const Icon(Icons.visibility_off),
                        color: const Color.fromARGB(255, 22, 94, 170),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.visibility),
                        color: const Color.fromARGB(255, 22, 94, 170),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                obscureText: isPasswordVisible,
                hintText: 'password',
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 50),
              Registrybottom(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.onSubmit(email: email!, password: password!);
                  }
                },
                buttonText: widget.buttonText,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.subtitle,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: Text(
                      widget.textbutton,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 155, 190, 251),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
