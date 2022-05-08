import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);
  late Animation omaranimation;
  late Animation<double> marginanimation2;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    omaranimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });

    marginanimation2 = Tween<double>(begin: 0, end: 500).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 234, 234),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Stack(
          children: [
            Image.asset("images/5.jpeg", fit: BoxFit.fitHeight),
            Center(
              child: Opacity(
                opacity: omaranimation.value,
                child: AnimatedContainer(
                  margin: EdgeInsets.only(top: marginanimation2.value),
                  duration: const Duration(milliseconds: 0),
                  child: ElevatedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "Get Started",
                            style: TextStyle(fontFamily: "gill", fontSize: 30),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_right_alt_sharp,
                            size: 40,
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("go");
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: Color.fromARGB(255, 198, 54, 44),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
