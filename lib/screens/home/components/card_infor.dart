import 'package:flutter/material.dart';

class CardInfor extends StatelessWidget {
  const CardInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.book),
            Text(
              "abcxyz",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ));
  }
}
