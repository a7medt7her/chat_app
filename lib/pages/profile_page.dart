import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  static const String routeName = 'profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? genderslected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color.fromARGB(205, 249, 244, 244),
                  child: Icon(Icons.edit, size: 15, color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            Textfield1(
              obscureText: false,
              hintText: 'Name',
              prefixIcon: Icon(Icons.person, color: Colors.blue),
            ),
            SizedBox(height: 25),
            DropdownButtonFormField<String>(
              value: genderslected,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.wc, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 219, 211, 209),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 10, 0, 0),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),

                hintText: 'Gender',

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 10, 0, 0),
                    width: 1.5,
                  ),

                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: ['Male', 'Female']
                  .map(
                    (gender) =>
                        DropdownMenuItem(value: gender, child: Text(gender)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  genderslected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
