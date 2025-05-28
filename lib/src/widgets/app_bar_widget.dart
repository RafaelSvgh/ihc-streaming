import 'package:flutter/material.dart';
import 'package:streaming/src/theme/app_theme.dart';

Widget appBar(String appBarTitle) {
  return Container(
    width: double.infinity,
    height: 80,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(appBarTitle, style: TextStylesFull.title),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Badge(
                label: Text('1'),
                child: Icon(Icons.notifications_none, size: 35),
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Color(0xff34538C),
                child: Text(
                  'M',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
