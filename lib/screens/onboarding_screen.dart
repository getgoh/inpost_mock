import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:inpost_mock/onboarding_data.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:inpost_mock/screens/map_screen.dart';
import 'package:inpost_mock/widgets/reusable_white_arc.dart';

class OnboardingScreen extends StatefulWidget {
  static final String id = 'onboarding_screen';
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  PageController _pageController;
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentPage);
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final upperWidth = MediaQuery.of(context).size.width * 1.5;
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      body: Container(
        color: Color(0xFFF5F7F8),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 7,
              child: ReusableWhiteArc(
                upperWidth: upperWidth,
                upperChild: Container(
                  child: PageView.builder(
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      _animationController.reset();
                      setState(() {
                        _currentPage = index;
                        _animationController.forward();
                      });
                    },
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Image.asset(
                          onboardingData[_currentPage].img,
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    },
                  ),
                ),
                lowerChild: Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleWidget(
                            color: _currentPage == 0
                                ? Color(0xFFFFC906)
                                : Color(0xFFF5F7F8)),
                        SizedBox(width: 10.0),
                        CircleWidget(
                            color: _currentPage == 1
                                ? Color(0xFFFFC906)
                                : Color(0xFFF5F7F8)),
                        SizedBox(width: 10.0),
                        CircleWidget(
                            color: _currentPage == 2
                                ? Color(0xFFFFC906)
                                : Color(0xFFF5F7F8)),
                        SizedBox(width: 10.0),
                        CircleWidget(
                            color: _currentPage == 3
                                ? Color(0xFFFFC906)
                                : Color(0xFFF5F7F8)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FadeTransition(
                        opacity: _animation,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              onboardingData[_currentPage].mainText,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              onboardingData[_currentPage].subText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 16.0),
                        color: Color(0xFFFDCA06),
                        onPressed: () {
                          Navigator.pushNamed(context, MapScreen.id);
//                          setState(() {
//                            _pageController.nextPage(
//                                duration: Duration(milliseconds: 600),
//                                curve: Curves.easeIn);
//                          });
                        },
                        child: Text('NEXT'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  final Color color;

  CircleWidget({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: this.color,
      ),
    );
  }
}
