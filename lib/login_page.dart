import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/loginController.dart';
import 'package:fyp_inventory/navigation_service.dart';
import 'package:lottie/lottie.dart';

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
  bool _userError = false;
  bool _passwordError = false;

  var errorText;

  _login() async {
    // Validate the form before logging in
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      var res = await LoginController.login(
          _emailPhoneController.text, _passwordController.text);

      if (res["statusCode"] == 200) {
        NavigationService().routeTo("homescreen");
      } else if (res["statusCode"] == 404) {
        //User Not Found
        setState(() {
          errorText = res["detail"];
          _userError = true;
        });
      } else if (res["statusCode"] == 401) {
        NavigationService().routeTo("serverdown");
      } else {
        //Incorrect Password
        setState(() {
          errorText = res["detail"];
          _passwordError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        backgroundColor: Color(0xFFffffff),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset('animations/38435-register.json',
                  height: 300, repeat: true, reverse: true, fit: BoxFit.cover),
              Container(
                height: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Color(0xFFE8E8E8).withOpacity(0.5),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 40),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Email/phone text form field,
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: _emailPhoneController,
                                  decoration: InputDecoration(
                                    hintText: 'Email or Phone Number',
                                    errorText: _userError ? errorText : null,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Color(0xFF004096)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Color(0xFF004096)),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _userError = false;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email or phone number';
                                    } else if (!value.contains('@') &&
                                        !RegExp(r'^(\+92)?[0-9]{10}$')
                                            .hasMatch(value)) {
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
                                    errorText:
                                        _passwordError ? errorText : null,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Color(0xFF004096)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Color(0xFF004096)),
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
                                          _isPasswordObscured =
                                              !_isPasswordObscured;
                                        });
                                      },
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _passwordError = false;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
=======
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Lottie.asset(
              'animations/38435-register.json',
              height: 300,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover,
            ),
            Container(
              height: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Color(0xFFE8E8E8).withOpacity(0.5),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 40,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email/phone text form field,
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: _emailPhoneController,
                            decoration: InputDecoration(
                              hintText: 'Email or Phone Number',
                              errorText: _userError ? errorText : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xFF004096),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xFF004096),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _userError = false;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email or phone number';
                              } else if (!value.contains('@') &&
                                  !RegExp(r'^(\+92)?[0-9]{10}$')
                                      .hasMatch(value)) {
                                return 'Please enter a valid email or phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        // Password text form field
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _isPasswordObscured,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              errorText: _passwordError ? errorText : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xFF004096),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color(0xFF004096),
                                ),
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
                                    _isPasswordObscured =
                                    !_isPasswordObscured;
                                  });
                                },
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _passwordError = false;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
>>>>>>> 52127dd101371c69da7aca0d99151d422f39ac6f
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: SizedBox(
                            height: 47,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _login,
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'If you forget your email or password, kindly contact Admin',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
<<<<<<< HEAD
            ]));
=======
            ),
          ],
        ),
      ),
    );
>>>>>>> 52127dd101371c69da7aca0d99151d422f39ac6f
  }
}
