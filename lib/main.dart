import 'package:chat_app/cubit/auth_cubit.dart';
import 'package:chat_app/cubit/message_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/SignUp_page.dart';
import 'package:chat_app/pages/homepage.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        BlocProvider<MessageCubit>(create: (_) => MessageCubit()),
      ],
      child: MaterialApp(
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          SignupPage.routeName: (context) => SignupPage(),
          Homepage.routeName: (context) => Homepage(),
        },
        debugShowCheckedModeBanner: false,

        initialRoute: SignupPage.routeName,
      ),
    );
  }
}
