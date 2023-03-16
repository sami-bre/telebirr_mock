import 'package:flutter/material.dart';

import 'list_card.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Hero(
                  tag: "Send",
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/icons/transfer.png",
                                  width: 44,
                                  height: 44,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Send money",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 26),
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
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
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
            title: "Send money",
            subtitle: "This is dummy content.",
          ),
          const ListCard(
            title: "Transfer to bank",
            subtitle: "This is dummy content.",
          ),
        ],
      ),
    );
  }
}
