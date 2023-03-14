import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screens = [
    const PromotionScreen(),
    const WalletScreen(),
    const AccountScreen(),
  ];
  int _selectedScreenIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens.elementAt(_selectedScreenIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over_rounded),
                label: "Promotion"),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded), label: "My account"),
          ],
          onTap: (value) {
            setState(() {
              _selectedScreenIndex = value;
            });
          },
          currentIndex: _selectedScreenIndex,
          selectedItemColor: Colors.green,
        ),
      ),
    );
  }
}

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isDarkMode = Get.isDarkMode;
  double _balanceBlurValue = 7;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _isDarkMode,
              onChanged: (bool value) {
                _isDarkMode
                    ? Get.changeThemeMode(ThemeMode.light)
                    : Get.changeThemeMode(ThemeMode.dark);
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
            const Text("Hello User!")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildBalanceView()
          ],
        )
      ],
    );
  }

  Container buildBalanceView() {
    return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[800]!, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: revealBallance,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 700),
                tween: Tween(begin: 7, end: _balanceBlurValue),
                curve: Curves.ease,
                builder: (context, value, child) {
                  return Blur(
                    blur: value,
                    borderRadius: BorderRadius.circular(10),
                    overlay: _balanceBlurValue != 0
                        ? const Text("tap to reveal balance")
                        : null,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "hey there",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }

  void revealBallance() {
    setState(() {
      _balanceBlurValue = 0;
    });
  }
}

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("This is promotion"),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("This is account screen"),
    );
  }
}
