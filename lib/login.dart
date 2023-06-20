import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'bottomnav.dart';
import 'home screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Global key for validating the form
  final _formKey = GlobalKey<FormState>();

  // Controllers for the text form fields
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variable to track if the password is obscured or not
  bool _isPasswordObscured = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Lottie.asset('animations/38435-register.json',
                    height: 300,
                    repeat: true,
                    reverse: true,
                    fit: BoxFit.cover),
                Container(
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Color(0xFFE8E8E8).withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 40),
                    child: Column(
                      children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email/phone text form field,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: TextFormField(
                                controller: _emailPhoneController,
                                decoration: InputDecoration(
                                  hintText: 'Email or Phone Number',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Color(0xFF004096)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Color(0xFF004096)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email or phone number';
                                  } else if (!value.contains('@') &&
                                      !RegExp(r'^(\+92)?[0-9]{10}$').hasMatch(value)) {
                                    return 'Please enter a valid email or phone number';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Password text form field
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: _isPasswordObscured,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Color(0xFF004096)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Color(0xFF004096)),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordObscured
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordObscured = !_isPasswordObscured;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: SizedBox(
                          height: 47,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate the form before logging in
                              if (_formKey.currentState!.validate()) {
                                // Perform login logic here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  HomeScreen()),
                                );// Validate the form before logging in

                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF004096).withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                        SizedBox(height: 10,),
                        Text('If you forget your email or password'
                            ' kindly contact Admin',style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 10
                        ),)

                      ],),
                  ),
                ),

              ]
          ),
        ));
  }}
