import 'package:blur/blur.dart';
import 'package:fl_chart/fl_chart.dart';
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
      child: Column(
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
          buildBalanceRow(),
          const SizedBox(height: 20),
          buildInfoRow(context),
          SizedBox(height: 2000)
        ],
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
                  backgroundColor: Colors.red,
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
                        BarChartRodData(toY: 420 * value, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 1, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 562, color: Colors.blue),
                        BarChartRodData(toY: 910 * value, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 2, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 1157 * value, color: Colors.blue),
                        BarChartRodData(toY: 225, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 3, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 496 * value, color: Colors.blue),
                        BarChartRodData(toY: 841 * value, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 4, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 1254 * value, color: Colors.blue),
                        BarChartRodData(toY: 594, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 5, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 270 * value, color: Colors.blue),
                        BarChartRodData(toY: 1008 * value, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 6, barRods: <BarChartRodData>[
                        BarChartRodData(toY: 417 * value, color: Colors.blue),
                        BarChartRodData(toY: 827 * value, color: Colors.red)
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
          const SizedBox(height: 5),
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
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
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
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Pay"),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 74,
                width: 74,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.barcode_reader),
                ),
              ),
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
