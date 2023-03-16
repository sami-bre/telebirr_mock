import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  const ListCard({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}