import 'package:blur/blur.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr_mock/ui/deposite_screen.dart';
import 'package:telebirr_mock/ui/fund_raising_screen.dart';
import 'package:telebirr_mock/ui/mini_statement_screen.dart';
import 'package:telebirr_mock/ui/pay_screen.dart';
import 'package:telebirr_mock/ui/receive_payment_screen.dart';
import 'package:telebirr_mock/ui/scan_screen.dart';
import 'package:telebirr_mock/ui/send_money_screen.dart';
import 'package:telebirr_mock/ui/transaction_screen.dart';
import 'package:telebirr_mock/ui/withdraw_screen.dart';

import 'buy_packages_screen.dart';
import 'financial_services_screen.dart';

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
  final daysList = const <Widget>[
    Text("Mo"),
    Text("Tu"),
    Text("We"),
    Text("Th"),
    Text("Fr"),
    Text("Sa"),
    Text("Su"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: 0,
      ),
      child: Builder(builder: (context) {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          return buildHomeScreenInPortrait(context);
        } else {
          return Column(
            children: [
              const SizedBox(height: 5),
              buildBrandRow(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: buildBalanceRow(),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(24, 0, 4, 0),
                    height: 160,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: buildInfoRow(context),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildActionButton(
                      context,
                      label: "Deposit",
                      brightImage: "assets/icons/deposit.png",
                      darkImage: "assets/icons/deposit.png",
                      goToWidget: const DepositScreen(),
                    ),
                    const SizedBox(width: 10),
                    buildActionButton(
                      context,
                      label: "Finance",
                      brightImage: "assets/icons/save-money.png",
                      darkImage: "assets/icons/save-money.png",
                      goToWidget: const FinancialServiceScreen(),
                    ),
                    const SizedBox(width: 10),
                    buildActionButton(
                      context,
                      label: "Send",
                      brightImage: "assets/icons/transfer.png",
                      darkImage: "assets/icons/transfer.png",
                      goToWidget: const SendMoneyScreen(),
                    ),
                    const SizedBox(width: 10),
                    buildActionButton(
                      context,
                      label: "Packages",
                      brightImage: "assets/icons/received.png",
                      darkImage: "assets/icons/received.png",
                      goToWidget: const BuyPackagesScreen(),
                    ),
                    const SizedBox(width: 10),
                    buildActionButton(
                      context,
                      label: "Receive",
                      brightImage: "assets/icons/reciever.png",
                      darkImage: "assets/icons/receiver.png",
                      goToWidget: const ReceivePaymentScreen(),
                    ),
                    const SizedBox(width: 10),
                    buildActionButton(
                      context,
                      label: "Fundraising",
                      brightImage: "assets/icons/donation.png",
                      darkImage: "assets/icons/donation.png",
                      goToWidget: const FundRaisingScreen(),
                    ),
                    const SizedBox(width: 10),
                    buildActionButton(
                      context,
                      label: "Withdraw",
                      brightImage: "assets/icons/money-withdrawal.png",
                      darkImage: "assets/icons/money-withdrawal.png",
                      goToWidget: const WithdrawScreen(),
                    ),
                    const SizedBox(width: 10),
                    buildActionButton(
                      context,
                      label: "Statement",
                      brightImage: "assets/icons/file.png",
                      darkImage: "assets/icons/file.png",
                      goToWidget: const MiniStatementScreen(),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  Column buildHomeScreenInPortrait(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          child: buildBrandRow(),
        ),
        const SizedBox(height: 30),
        buildBalanceRow(),
        const SizedBox(height: 20),
        buildInfoRow(context),
        const SizedBox(height: 20),
        buildActionsRowInPortrait(context),
      ],
    );
  }

  Row buildBrandRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/icons/telebirr-logo.png",
          height: 68,
        ),
        const Spacer(),
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
        Text(
          "Hello Sami",
          style: MediaQuery.of(context).orientation == Orientation.landscape
              ? Theme.of(context).textTheme.titleLarge
              : Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.grey[800]),
        )
      ],
    );
  }

  Column buildActionsRowInPortrait(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildActionButton(
                context,
                label: "Deposit",
                brightImage: "assets/icons/deposit.png",
                darkImage: "assets/icons/deposit.png",
                goToWidget: const DepositScreen(),
              ),
              buildActionButton(
                context,
                label: "Finance",
                brightImage: "assets/icons/save-money.png",
                darkImage: "assets/icons/save-money.png",
                goToWidget: const FinancialServiceScreen(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildActionButton(
                context,
                label: "Send",
                brightImage: "assets/icons/transfer.png",
                darkImage: "assets/icons/transfer.png",
                goToWidget: const SendMoneyScreen(),
              ),
              buildActionButton(
                context,
                label: "Packages",
                brightImage: "assets/icons/received.png",
                darkImage: "assets/icons/received.png",
                goToWidget: const BuyPackagesScreen(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildActionButton(
                context,
                label: "Receive",
                brightImage: "assets/icons/reciever.png",
                darkImage: "assets/icons/receiver.png",
                goToWidget: const ReceivePaymentScreen(),
              ),
              buildActionButton(
                context,
                label: "Fundraising",
                brightImage: "assets/icons/donation.png",
                darkImage: "assets/icons/donation.png",
                goToWidget: const FundRaisingScreen(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildActionButton(
                context,
                label: "Withdraw",
                brightImage: "assets/icons/money-withdrawal.png",
                darkImage: "assets/icons/money-withdrawal.png",
                goToWidget: const WithdrawScreen(),
              ),
              buildActionButton(
                context,
                label: "Statement",
                brightImage: "assets/icons/file.png",
                darkImage: "assets/icons/file.png",
                goToWidget: const MiniStatementScreen(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildActionButton(
    /// these buttons (on one screen) should have different labes to work as a hero.
    BuildContext context, {
    required String label,
    required String brightImage,
    required String darkImage,
    required Widget goToWidget,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => goToWidget,
          ),
        );
      },
      child: Hero(
        tag: label,
        child: SizedBox(
          height: 90,
          width: 160,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    brightImage,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.blue[600], fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildInfoRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 8,
                ),
                SizedBox(width: 5),
                Text("Accepted"),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 8,
                ),
                SizedBox(width: 5),
                Text("Payed"),
                Spacer(),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 2,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1500),
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.ease,
              builder: (context, value, child) {
                return BarChart(
                  BarChartData(
                    barGroups: <BarChartGroupData>[
                      BarChartGroupData(x: 0, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 700 * value, color: Colors.blue),
                        BarChartRodData(toY: 420 * value, color: Colors.orange)
                      ]),
                      BarChartGroupData(x: 1, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 562, color: Colors.blue),
                        BarChartRodData(toY: 910 * value, color: Colors.orange)
                      ]),
                      BarChartGroupData(x: 2, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 1157 * value, color: Colors.blue),
                        BarChartRodData(toY: 225, color: Colors.orange)
                      ]),
                      BarChartGroupData(x: 3, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 496 * value, color: Colors.blue),
                        BarChartRodData(toY: 841 * value, color: Colors.orange)
                      ]),
                      BarChartGroupData(x: 4, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 1254 * value, color: Colors.blue),
                        BarChartRodData(toY: 594, color: Colors.orange)
                      ]),
                      BarChartGroupData(x: 5, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 270 * value, color: Colors.blue),
                        BarChartRodData(toY: 1008 * value, color: Colors.orange)
                      ]),
                      BarChartGroupData(x: 6, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 417 * value, color: Colors.blue),
                        BarChartRodData(toY: 827 * value, color: Colors.orange)
                      ]),
                    ],
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) =>
                                daysList[value.toInt()],
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false))),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Spacer(),
              Text(
                "Transactions",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: 30),
              SizedBox(
                width: 100,
                height: 46,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TransactionScreen(),
                      ),
                    );
                  },
                  child: const Text("More"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  SizedBox buildBalanceRow() {
    return SizedBox(
      height: 168,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 74,
                width: 74,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PayScreen(),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "pay",
                    child: SizedBox(
                      height: 74,
                      width: 74,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  "assets/icons/money_2.png",
                                  width: 42,
                                  height: 42,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ScanScreen(),
                    ),
                  );
                },
                child: Hero(
                  tag: "scan",
                  child: SizedBox(
                    height: 74,
                    width: 74,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/icons/qr-code.png",
                                width: 42,
                                height: 42,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   height: 74,
              //   width: 74,
              //   child: ElevatedButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(Colors.blue),
              //       shape: MaterialStateProperty.all(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //       ),
              //     ),
              //     onPressed: () {},
              //     child: Image.asset(
              //       "assets/icons/qr-code.png",
              //       width: 34,
              //       height: 34,
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: buildBalanceView(),
          ),
        ],
      ),
    );
  }

  Widget buildBalanceView() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue[800]!, width: 2),
        borderRadius: BorderRadius.circular(30),
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
              borderRadius: BorderRadius.circular(30),
              overlay: _balanceBlurValue != 0
                  ? const Text("tap to reveal balance")
                  : null,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "hey there",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ],
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
