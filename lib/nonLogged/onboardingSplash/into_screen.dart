library flutteronboardingscreens;

import 'package:AsistenKu/nonLogged/loggin/page_login.dart';
import 'package:AsistenKu/nonLogged/onboardingSplash/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A IntroScreen Class.
///
///
class IntroScreen extends StatefulWidget {
  final List<OnbordingData> onbordingDataList;
  final MaterialPageRoute pageRoute;
  IntroScreen(this.onbordingDataList, this.pageRoute);

  void skipPage(BuildContext context) {
    Get.offAll(PageLoggin());
  }

  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onbordingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 10,
                child: PageView(
                  children: widget.onbordingDataList,
                  controller: controller,
                  onPageChanged: _onPageChanged,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: Text(lastPage ? "" : "Skip",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0)),
                    onPressed: () => lastPage
                        ? null
                        : widget.skipPage(
                            context,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      child: Row(
                        children: [
                          _buildPageIndicator(0),
                          _buildPageIndicator(1),
                          _buildPageIndicator(2),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(82, 150, 214, 0.11),
                              blurRadius: 7,
                              spreadRadius: 0,
                              offset: Offset(4, 0), // Shadow position
                            ),
                          ],
                          shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_forward),
                    ),
                    onPressed: () => lastPage
                        ? widget.skipPage(context)
                        : controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
