import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:logger/logger.dart';
import 'package:taskmaker/widgets/custom_btn.dart';

import 'login_controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/welcome.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Animate(
                  effects: const [
                    SlideEffect(
                        duration: Duration(
                          milliseconds: 900,
                        ),
                        curve: Curves.linear)
                  ],
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text('DoMeNow',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                CustomButton(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        final user = await LoginController.loginWithGoogle();
                        if (user != null) {
                          setState(() {
                            isLoading = true;
                          });
                        } else {
                          CherryToast.error(
                              title: const Text('Failed to authenticate user'));
                        }
                      } on FirebaseAuthException catch (error) {
                        CherryToast.error(
                            title: const Text('Failed to authenticate user'));
                      } catch (e) {
                        Logger().i(e);
                        Logger().f(e);
                      }
                    },
                    image: SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/google.png')),
                    text: 'Google Sign In',
                    isBusy: isLoading)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
