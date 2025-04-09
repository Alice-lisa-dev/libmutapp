import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  'Create an Account / Register here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildTextField('Full Name'),
                  SizedBox(height: 10),
                  _buildTextField('Email Address'),
                  SizedBox(height: 10),
                  _buildTextField('Password', obscureText: true),
                  SizedBox(height: 10),
                  _buildTextField('Retry Password', obscureText: true),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            agreeToTerms = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the terms and privacy',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: agreeToTerms ? () {
                        // Handle registration logic here
                      } : null,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Login page
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Have an account? ',
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
