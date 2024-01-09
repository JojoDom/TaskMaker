import 'package:flutter/material.dart';

import '../dashboard/models/intro_model.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final int _currentPage = 0;
  final pageController = PageController();

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInToLinear,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : const Color(0xFFD9D9D9),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < intro.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SafeArea(
          child: PageView.builder(
              pageSnapping: true,
              physics: const ClampingScrollPhysics(),
              itemCount: intro.length,
              itemBuilder: (context, index) => SizedBox(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${intro[index].image}'),
                                  fit: BoxFit.contain)),
                        ),
                        Text(intro[index].title),
                        Text(intro[index].content),
                        Row(
                          children: [
                            const Text('Skip'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicatorStatic(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
