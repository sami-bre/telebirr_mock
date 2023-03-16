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
                              color: Colors.grey[300],
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
            const Spacer(flex: 1),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Text(
                  "This is dummy content.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
