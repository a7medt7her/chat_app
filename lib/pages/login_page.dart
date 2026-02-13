import 'package:chat_app/cubit/auth_cubit.dart';
import 'package:chat_app/pages/homepage.dart';
import 'package:chat_app/widgets/login&signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 94, 170),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return Center(child: CircularProgressIndicator());
              },
            );
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login Successful')));
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.pushReplacementNamed(context, Homepage.routeName);
          } else if (state is AuthError) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(); // Close the loading dialog
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Login_signup(
          buttonText: 'LogIn',
          title: 'Log In To Continue',
          textbutton: 'Sign Up',
          subtitle: 'Don\'t Have Account?',
          onSubmit: ({required email, required password}) {
            context.read<AuthCubit>().login(email: email, password: password);
          },
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
