import 'dart:io';

import 'package:chat_app/cubit/cubit/user_data_cubit.dart';
import 'package:chat_app/helper/pickimage.dart';
import 'package:chat_app/pages/homepage.dart';
import 'package:chat_app/widgets/custom_DropdownButton.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:chat_app/widgets/registrybottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  static const String routeName = 'profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? genderslected;
  String? selectedImage;
  String? ageSelected;
  String? genderSelected;
  String? name;
  String? bio;
  late final String uid;

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataCubit, UserDataState>(
      listener: (context, state) {
        if (state is UserDataSuccess) {
          Navigator.pushReplacementNamed(context, Homepage.routeName);
        }

        if (state is UserDataError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 94, 170),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 22, 94, 170),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/scholar.png', height: 40),
              Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 50,
                backgroundImage: selectedImage != null
                    ? FileImage(File(selectedImage!), scale: 1)
                    : AssetImage('assets/images/profile.png'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color.fromARGB(205, 249, 244, 244),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pickImage().then((image) {
                            if (image != null) {
                              selectedImage = image;
                            }
                          });
                        });
                      },
                      icon: Icon(Icons.edit, size: 15, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Textfield1(
                onChanged: (value) {
                  name = value;
                },
                obscureText: false,
                hintText: 'Name',
                prefixIcon: Icon(Icons.person, color: Colors.blue),
              ),
              SizedBox(height: 25),
              Textfield1(
                onChanged: (value) {
                  bio = value;
                },
                obscureText: false,
                hintText: 'Bio',
                prefixIcon: Icon(Icons.info_outline, color: Colors.blue),
              ),
              SizedBox(height: 25),
              CustomDropdownbutton(
                items: ['Male', 'Female', 'Other'],
                prefixIcon: Icons.wc,
                hintText: 'Gender',
                onChanged: (value) {
                  genderSelected = value;
                },
              ),
              SizedBox(height: 25),
              CustomDropdownbutton(
                items: ['18-25', '26-35', '36-45', '46+'],
                prefixIcon: Icons.format_list_numbered,
                hintText: 'Age',
                onChanged: (value) {
                  ageSelected = value;
                },
              ),
              SizedBox(height: 40),
              Registrybottom(
                onPressed: () {
                  if (name == null ||
                      bio == null ||
                      genderSelected == null ||
                      ageSelected == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all the fields')),
                    );
                    return;
                  } else if (name!.length < 3 || name!.length > 20) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Name must be between 3 and 20 characters',
                        ),
                      ),
                    );
                    return;
                  }
                  context.read<UserDataCubit>().senduserdata(
                    name!,
                    bio!,
                    ageSelected!,
                    genderSelected!,
                    uid,
                    selectedImage!,
                  );
                },
                buttonText: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
