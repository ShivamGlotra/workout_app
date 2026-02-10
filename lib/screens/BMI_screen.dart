import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  int? _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 360),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_outline,
                        size: 40,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome To WeGoJim",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _groupValue == 0
                        ? "Login to continue your fitness journey"
                        : "Create an account to get started",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ),
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
                borderRadius: BorderRadius.circular(12), // rounded corners
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CupertinoSlidingSegmentedControl<int>(
                    backgroundColor:
                        Colors.grey.shade200, // Background pill color
                    thumbColor: Colors.white, // The "active" button color
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
                  _groupValue == 0 ? metric() : imperial(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget metric() {
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

  Widget imperial() {
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
}
