import 'package:chat_app/cubit/auth_cubit.dart';
import 'package:chat_app/pages/homepage.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/login&signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});
  static const String routeName = 'signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Login_signup(
          buttonText: 'Sign Up',
          title: 'sign up to continue',
          textbutton: 'LogIn',
          subtitle: 'Already Have Account?',
          onSubmit: ({required email, required password}) {
            context.read<AuthCubit>().signUp(email: email, password: password);
          },
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.routeName);
          },
        ),
      ),
    );
  }
}
