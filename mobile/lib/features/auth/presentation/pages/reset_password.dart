import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/pages/new_password.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 126,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Reset Your Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF06164B),
                      fontSize: 28,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0.05,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Forget your password? No problem! Enter \n your email below, and we\'ll send a reset \n link your way.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5A5D72),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
                child: Column(
              children: [
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
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 70.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink),
                      ),
                      onPressed: () {
                        //Navigate to the reset password page

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SetNewPassword()),
                        );
                      },
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
