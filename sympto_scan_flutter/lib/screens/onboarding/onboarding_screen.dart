import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:sympto_scan_flutter/screens/login_signup/auth_page.dart';
import 'package:sympto_scan_flutter/screens/symptoms/symptoms.dart';

import '../login_signup/login_page.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
              waveType: WaveType.liquidReveal,
              enableLoop: false,
              pages: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Image(
                            image:
                                const AssetImage('assets/images/onboard1.png'),
                            height: size.height * 0.3,
                          ),
                        ),
                        Text(
                          'Hi! I\'m Symto Scan👋, \nyour personal health assistant',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple),
                        ),
                        Container(
                          padding: const EdgeInsets.all(18.0),
                          width: size.width * 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.black,
                          ),
                          child: Text(
                            '1/3',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                        ),
                        Text(
                          'Swipe to continue  >>👉',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xfffddcdf),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Image(
                            image:
                                const AssetImage('assets/images/onboard2.png'),
                            height: size.height * 0.3,
                          ),
                        ),
                        Text(
                          'Track your symptoms and \nget instant diagnosis',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan[600]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(18.0),
                          width: size.width * 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.black,
                          ),
                          child: Text(
                            '2/3',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                        ),
                        Text(
                          'Swipe to continue  >>👉',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xffffdcbd),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Image(
                            image:
                                const AssetImage('assets/images/onboard3.png'),
                            height: size.height * 0.3,
                          ),
                        ),
                        Text(
                          'Get the care you need \nfrom the comfort of your home.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => AuthPage()/*Symptoms()*/,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(18.0),
                            width: size.width * 0.4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.black,
                            ),
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                        Text(
                          'Login To Continue ☝️',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
