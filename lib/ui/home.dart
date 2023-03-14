import 'package:flutter/material.dart';

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
  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.record_voice_over_rounded), label: "Promotion"),
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
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("This is wallet screen"),
    );
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
