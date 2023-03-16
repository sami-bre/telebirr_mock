import 'package:flutter/material.dart';

import 'list_card.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

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
                    tag: "Deposit",
                    child: SizedBox(
                      height: 140,
                      child: Material(
                        elevation: 4,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const ListCard(
              title: "Agent",
              subtitle: "This is dummy content.",
            ),
            const ListCard(
              title: "Apply deposit voucher",
              subtitle: "This is dummy content.",
            )
          ],
        ),
      ),
    );
  }
}
