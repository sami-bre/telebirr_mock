import 'package:flutter/material.dart';

import 'list_card.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: "scan",
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/qr-code.png",
                                    width: 44,
                                    height: 44,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Scan QR code.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 20,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.blue,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const ListCard(
              title: "Buy Airtime",
              subtitle: "This is dummy content.",
            ),
            const ListCard(
              title: "Buy package",
              subtitle: "This is dummy content",
            ),
            const ListCard(
              title: "Buy airtime via endekise",
              subtitle: "This is dummy content",
            ),
            const ListCard(
              title: "Buy package via endekise",
              subtitle: "This is dummy content",
            ),
            const ListCard(
              title: "Unsubscribe package",
              subtitle: "This is dummy content",
            ),
          ],
        ),
      ),
    );
  }
}
