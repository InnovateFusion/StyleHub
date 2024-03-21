import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: _buildPageViewItem,
      ),
    );
  }

  Widget _buildPageViewItem(BuildContext context, int index) {
    return Container(
      width: 360,
      height: 800,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Discover',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '  Limitless Style ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                  text: const TextSpan(
                text: ' On Style Hub ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color of "On Style Hub"
                ),
              )),
            ],
          ),

          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text:
                  ' Discover StyleHub\'s endless style and \ntrends with curated collections',
              style: TextStyle(
                color: Color(0xFF5A5D72),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 1.2,
                letterSpacing: 0.50,
              ),
            ),
          ),

          // Image
          Container(
            decoration: BoxDecoration(
              color: const Color(0XFFF4F2FA),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Image.asset(
              'assets/images/onboarding${index + 1}.png',
              height: 300.0,
              width: 280.0,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.all(4.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  child: CircleAvatar(
                    radius: 6.0,
                    backgroundColor:
                        _currentPage == index ? Colors.pink : Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            height: 100.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Text('GET STARTED')),
            ),
          )
        ],
      ),
    );
  }
}
