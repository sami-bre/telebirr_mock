import 'package:flutter/material.dart';

class FinancialServiceScreen extends StatelessWidget {
  const FinancialServiceScreen({super.key});

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
                    tag: "Finance",
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
                                "assets/icons/save-money.png",
                                width: 44,
                                height: 44,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Financial service",
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
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
