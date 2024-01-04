import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Stack(children: [
        //  Container(
        //     decoration: const BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage('assets/images/welcome.jpg'),
        //             fit: BoxFit.cover)),
        //   ),
          Positioned.fill(child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Column(
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
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
              ],
            ),
          ))
      ],),
    );
  }
}
