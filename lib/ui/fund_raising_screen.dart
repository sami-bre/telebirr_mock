import 'package:flutter/material.dart';

class FundRaisingScreen extends StatelessWidget {
  const FundRaisingScreen({super.key});

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
                    tag: "Fundraising",
                    child: SizedBox(
                      height: 140,
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
                                "assets/icons/donation.png",
                                width: 44,
                                height: 44,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Fundraising",
                                style: Theme.of(context).textTheme.titleLarge,
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
            Row(
              children: const [
                Icon(
                  Icons.payments_outlined,
                  size: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
