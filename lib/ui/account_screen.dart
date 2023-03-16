import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: 10,
        ),
        child: Column(
          children: [
            Hero(
              tag: "title",
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: buildBrandRow(context),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Text(
                      "Samuel Birhanu",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  subtitle: Text(
                    "+251974***739  Customer level 3",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBrandRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/icons/telebirr-logo.png",
          height: 68,
        ),
        const Spacer(),
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
}
