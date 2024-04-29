import 'package:flutter/material.dart';
import 'package:mobile/features/onboarding/presentation/pages/onboarding.dart';
import 'package:pinput/pinput.dart';

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class Pininput extends StatefulWidget {
  const Pininput({Key? key}) : super(key: key);

  @override
  State<Pininput> createState() => _PininputState();
}

class _PininputState extends State<Pininput> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  late String pinCode;
  // @override
  // void initState() {
  //   super.initState();
  //   _loadPinCode();
  // }

  // Future<void> _loadPinCode() async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   // final pin = prefs.getString('pin');
  //   final String? pin = Hive.box<String>(pin_code).get('pin');
  //   setState(() {
  //     pinCode = pin!;
  //   });

  //   print('=====> $pinCode');
  // }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        margin: const EdgeInsets.only(top: 100),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Verify Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF06164B),
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.05,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  width: 328,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Please enter the code we just sent to email ',
                          style: TextStyle(
                            color: Color(0xFF5A5D72),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 2.0,
                            letterSpacing: 0.50,
                          ),
                        ),
                        TextSpan(
                          text: 'example@gmail.com',
                          style: TextStyle(
                            color: Color(0xFFEE1E80),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Directionality(
                  // Specify direction if desired
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    controller: pinController,
                    focusNode: focusNode,
                    listenForMultipleSmsOnAndroid: true,
                    // defaultPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    validator: (value) {
                      return value == pinCode ? null : 'Pin is incorrect';
                    },
                    onClipboardFound: (value) {
                      debugPrint('onClipboardFound: $value');
                      pinController.setText(value);
                    },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                      setState(() {
                        pinController.text = pin;
                      });
                    },

                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color((0xFF5A5D72))),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                        ),
                        child: const Text(
                          "Enter",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (pinController.text == pinCode) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnboardingPage()),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center the children horizontally
                  children: [
                    const Text(
                      'Didn\'t receive the code?',
                      style: TextStyle(
                        color: Color(0xFF06164B),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                        letterSpacing: 0.25,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle sign up
                      },
                      child: const Text(
                        'resend code',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
