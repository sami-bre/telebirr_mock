import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  final PageController controller = PageController(initialPage: 0);

  int counter = 0; // a counter to track which "page" we're at
  List<Widget> pictures = []; // list of the 3 pictures on the 3 "pages"
  List<Widget> messages = []; // list of the 3 messages on the 3 "pages"
  List<Widget> buttons = []; // list of the TWO buttons on the 3 "pages"
  late Widget displayedPicture; // the image currently displayed
  late Widget displayedMessage;
  late Widget displayedButton;

  @override
  void initState() {
    super.initState();
  }

  void createWidgets() {
    // this method populates the lists of widgets we use on the 3 pages
    // populating the pictures list
    pictures.addAll([
      buildPromotionPicture("assets/images/promotion-1.png"),
      buildPromotionPicture("assets/images/promotion-2.png"),
      buildPromotionPicture("assets/images/promotion-3.png"),
    ]);
    // populating the buttons list
    Widget button;
    button = buildButton("Next", () {
      counter++;
      setState(() {
        displayedPicture = pictures[counter];
        displayedMessage = messages[counter];
        displayedButton = buttons[counter];
      });
    });
    buttons.add(button);
    button = buildButton("Next", () {
      counter++;
      setState(() {
        displayedPicture = pictures[counter];
        displayedMessage = messages[counter];
        displayedButton = buttons[counter];
      });
    });
    buttons.add(button);
    buttons.add(
      buildButton("Get started", () {}),
    );
    // populating the messages list
    messages.addAll([
      buildMessage(
        "Learn anytime, and anywhere",
        "Lorem ipsum dolor sit amet consectetur"
            " adipiscing elit Ut et massa mi. Aliquam in hendrerit.",
      ),
      buildMessage(
        "Unleash Your Creativity and Compete with Style",
        "Lorem ipsum dolor sit amet consectetur"
            " adipiscing elit Ut et massa mi. Aliquam in hendrerit.",
      ),
      buildMessage(
          "High quality lectures and unlimited questions",
          "Lorem ipsum dolor sit amet consectetur"
              " adipiscing elit Ut et massa mi. Aliquam in hendrerit.")
    ]);
    // at the start, we show the first elements from each list
    displayedPicture = pictures[counter];
    displayedMessage = messages[counter];
    displayedButton = buttons[counter];
  }

  Widget buildMessage(String mainMessage, String subMessage) {
    return SizedBox(
      key: UniqueKey(),
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: <Widget>[
            Text(
              mainMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              subMessage,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String label, VoidCallback onTap) {
    return SizedBox(
      key: UniqueKey(),
      width: 240,
      height: 50,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0396FF), Color.fromARGB(255, 110, 195, 255)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPromotionPicture(String assetName) {
    return SizedBox(
      key: UniqueKey(),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(assetName)),
    );
  }

  Widget buildPageControlDots(int currentPageNumber) {
    return Row(
      key: UniqueKey(),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var index = 0; index < 3; index++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 5,
              backgroundColor:
                  index == currentPageNumber ? Colors.blue : Colors.blue[100],
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // we will maintain the same layout-forming column but switch the
    // contained widgets in order to show the 3 different "pages"
    createWidgets();
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Spacer(flex: 3),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: displayedPicture,
          ),
          const Spacer(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: displayedMessage,
          ),
          const Spacer(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: buildPageControlDots(counter),
          ),
          const Spacer(
            flex: 2,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: displayedButton,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
