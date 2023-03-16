import 'package:flutter/material.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  int counter = 0; // a counter to track which "page" we're at
  List<Widget> pictures = []; // list of the 5 pictures on the 5 "images"
  List<Widget> messages = []; // list of the 5 messages on the 5 "images"
  late Widget displayedPicture; // the image currently displayed
  late Widget displayedMessage;

  @override
  void initState() {
    loopThroughPromotions();
    super.initState();
  }

  void createWidgets() {
    // this method populates the lists of widgets we use on the 3 images
    // populating the pictures list
    pictures.addAll([
      buildPromotionPicture("assets/images/promotion-1.png"),
      buildPromotionPicture("assets/images/promotion-2.png"),
      buildPromotionPicture("assets/images/promotion-3.png"),
      buildPromotionPicture("assets/images/promotion-4.png"),
      buildPromotionPicture("assets/images/promotion-5.png"),
    ]);
    // populating the messages list
    messages.addAll([
      buildMessage(
        "Send and recieve money via telebirr.",
        "Wherever you are!",
      ),
      buildMessage(
        "Scan and pay your service bill via telebirr.",
        "Easy and easy and convenient!",
      ),
      buildMessage(
          "Pay your telecom bill via telebirr.", "Save your valuable time!"),
      buildMessage(
          "Buy airtime via telebirr anywhere anytime.", "Stay connected!"),
      buildMessage("Scan and pay your service bill via telebirr.",
          "Easy and easy and convenient!")
    ]);
    // at the start, we show the first elements from each list
    displayedPicture = pictures[counter];
    displayedMessage = messages[counter];
  }

  Widget buildMessage(String mainMessage, String subMessage) {
    return SizedBox(
      key: UniqueKey(),
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              mainMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              subMessage,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loopThroughPromotions() {
    Stream.periodic(const Duration(seconds: 4)).listen((event) {
      setState(() {
        counter = (counter + 1) % 5;
      });
    });
  }

  Widget buildPromotionPicture(String assetName) {
    return SizedBox(
      key: UniqueKey(),
      height: 334,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(assetName),
        ),
      ),
    );
  }

  Widget buildPageControlDots(int currentPageNumber) {
    return Row(
      key: UniqueKey(),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var index = 0; index < 5; index++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 5,
              backgroundColor:
                  index == currentPageNumber ? Colors.green : Colors.blue[100],
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // we will maintain the same layout-forming column but switch the
    // contained widgets in order to show the 5 different images
    createWidgets();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 600,
            child: Column(
              children: <Widget>[
                const Spacer(flex: 3),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: displayedPicture,
                ),
                const Spacer(),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: displayedMessage,
                ),
                const Spacer(),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: buildPageControlDots(counter),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}