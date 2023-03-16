import 'package:flutter/material.dart';

import 'list_card.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Hero(
                  tag: "Deposit",
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          elevation: 4,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/icons/deposit.png",
                                  width: 44,
                                  height: 44,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Deposit cash",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 26)
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(height: 24),
                  ListCard(
                    title: "Agent",
                    subtitle: "This is dummy content.",
                  ),
                  ListCard(
                    title: "Apply deposit voucher",
                    subtitle: "This is dummy content.",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
