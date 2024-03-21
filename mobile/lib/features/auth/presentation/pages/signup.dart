import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 328,
                height: 76,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF06164B),
                        fontSize: 30,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0.05,
                      ),
                    ),
                    Text(
                      'Fill your information below or register with\n your social account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5A5D72),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0.20,
                      ),
                    ),
                  ],
                ),
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 16.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFF7FBFD),
                                  width: 1.0), // Change the border color here
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 78, 77, 77),
                                  width: 0.5), // Change the border color here
                            ),
                            filled: true,
                            fillColor: const Color(
                                0xFFF7FBFD) // Change this to your desired color
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your First Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 16.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFF7FBFD),
                                  width: 1.0), // Change the border color here
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 78, 77, 77),
                                  width: 0.5), // Change the border color here
                            ),
                            filled: true,
                            fillColor: const Color(
                                0xFFF7FBFD) // Change this to your desired color
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Last Name ';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 16.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFF7FBFD),
                                  width: 1.0), // Change the border color here
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 78, 77, 77),
                                  width: 0.5), // Change the border color here
                            ),
                            filled: true,
                            fillColor: const Color(
                                0xFFF7FBFD) // Change this to your desired color
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Last Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 16.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFF7FBFD),
                                  width: 1.0), // Change the border color here
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 78, 77, 77),
                                  width: 0.3), // Change the border color here
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF7FBFD)),
                        // Rest of your code...
                      ),
                    ),

                    // Rest of your code...
                  ],
                ),
              ),

              //Button to sign in
              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                height: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // Navigate to the home page
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // Rest of your code...
              Container(
                width: 328,
                height: 20,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 1, // This will create a straight line
                      width: 72,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFEFEDF4),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Or sign in with ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5A5D72),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 1, // This will create a straight line
                      width: 72,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFEFEDF4),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // This will space the buttons evenly

                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      // Handle Facebook sign in
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const CircleBorder()), // Make the button circular
                      side: MaterialStateProperty.all(const BorderSide(
                          color: Color(0xFFE9E7EF))), // Outline the button
                      padding: MaterialStateProperty.all(const EdgeInsets.all(
                          4)), // Add some padding to make it look like a circle
                    ),
                    child: const Icon(FontAwesomeIcons.facebookF,
                        color: Colors.blue),
                  ),

                  // ...
                  OutlinedButton(
                    onPressed: () {
                      // Handle Twitter sign in
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const CircleBorder()), // Make the button circular
                      side: MaterialStateProperty.all(const BorderSide(
                          color: Color(0xFFE9E7EF))), // Outline the button
                      padding: MaterialStateProperty.all(const EdgeInsets.all(
                          4)), // Add some padding to make it look like a circle
                    ),
                    child: const Icon(FontAwesomeIcons.xTwitter,
                        color: Colors.black),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Handle Google sign in
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const CircleBorder()), // Make the button circular
                      side: MaterialStateProperty.all(const BorderSide(
                          color: Color(0xFFE9E7EF))), // Outline the button
                      padding: MaterialStateProperty.all(const EdgeInsets.all(
                          4)), // Add some padding to make it look like a circle
                    ),
                    child: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Center the children horizontally
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Color(0xFF06164B),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                      letterSpacing: 0.50,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle sign up
                      //pop the current page

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color(0xFFEE1E80),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
