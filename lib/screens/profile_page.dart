import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercise_list_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int? _groupValue = 0;
  final List<String> profileHeading = [
    "Sign In",
    "Register",
    "Create an account or log in to save your workout plans, track progress, and access your data across devices.",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.widthOf(context) * .9,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExerciseHeaderSection(heading: profileHeading),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 40,
                        right: 40,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(
                            255,
                            221,
                            219,
                            219,
                          ), // border color
                          width: 1, // border width
                        ),
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // rounded corners
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CupertinoSlidingSegmentedControl<int>(
                            backgroundColor:
                                Colors.grey.shade200, // Background pill color
                            thumbColor:
                                Colors.white, // The "active" button color
                            groupValue: _groupValue,
                            children: {
                              0: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              1: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            },
                            onValueChanged: (value) {
                              setState(() => _groupValue = value);
                            },
                          ),
                          SizedBox(height: 20),
                          _groupValue == 0 ? loginForm() : signupForm(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    whyCreateAccount(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget loginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "johndoe@mail.com",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.mail_outline_rounded,
                color: Colors.grey,
                size: 15,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "*********",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
                size: 15,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        SizedBox(height: 15),
        TextButton(
          onPressed: () => (),
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Login"),
        ),
      ],
    );
  }

  Widget signupForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "John Doe",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.mail_outline_rounded,
                color: Colors.grey,
                size: 15,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "johndoe@mail.com",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.mail_outline_rounded,
                color: Colors.grey,
                size: 15,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "*********",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
                size: 15,
              ),
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        SizedBox(height: 15),
        TextButton(
          onPressed: () => (),
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Create Account"),
        ),
      ],
    );
  }

  Widget whyCreateAccount() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 233, 233),
        border: Border.all(
          color: const Color.fromARGB(255, 221, 219, 219), // border color
          width: 1, // border width
        ),
        borderRadius: BorderRadius.circular(12), // rounded corners
      ),
      constraints: BoxConstraints(maxWidth: 360),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Why Create an Account?",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBulletPoint("Get personalized workout recommendations"),
                  _buildBulletPoint("Track your progress and achievements"),
                  _buildBulletPoint("Save custom workout plans"),
                  _buildBulletPoint("Access AI fitness coach anytime"),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String accountBenefits) {
    return Row(
      children: [
        Icon(Icons.square, size: 5, color: Colors.black),
        SizedBox(width: 8),
        Text(
          accountBenefits,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}
