import 'package:curso_ifal_flutter/shared/widgets/top_bar_back_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/sign_signup_page.dart';
import 'package:flutter/material.dart';

class OnboardingPageContent extends StatelessWidget {
  String imagePath;
  String title;
  String description;
  PageController pageController;
  int pageIndex;
  int pagesLength;

  late Size size;

  OnboardingPageContent({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.pageController,
    required this.pageIndex,
    required this.pagesLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: pageIndex > 0
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            children: [
              if (pageIndex > 0) _buildBackButton(),
              _buildSkipOnboarding(context),
            ],
          ),
        ),
        Image.asset(
          imagePath,
          width: size.width * 0.8,
          height: size.width * 0.8,
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade800,
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            if (pageIndex == pagesLength) {
              skip(context);
              return;
            }

            pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 13.0),
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton() {
    return TopBarBackButtonWidget(onTabCallback: () {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  Widget _buildSkipOnboarding(BuildContext context) {
    return TextButton(
      onPressed: () {
        skip(context);
      },
      child: Text(
        'Pular',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  void skip(BuildContext context) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SignInSingUpPage()));
    Navigator.pushNamed(context, '/toSignUpPage');
  }
}
