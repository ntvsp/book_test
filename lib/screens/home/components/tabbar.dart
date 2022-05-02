import 'package:flutter/material.dart';

class TabBarCusTom extends StatelessWidget {
  const TabBarCusTom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 6,
        child: TabBar(
          isScrollable: true,
          labelColor: Colors.black,
          labelPadding: EdgeInsets.only(top: 10, bottom: 10),
          unselectedLabelColor: Colors.black,
          indicator: UnderlineTabIndicator(
            insets: EdgeInsets.all(5),
          ),
          indicatorWeight: 0,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            TabBarElement(
              txtLabel: 'Phổ biến',
            ),
            TabBarElement(
              txtLabel: 'Bán chạy',
            ),
            TabBarElement(
              txtLabel: 'Được xem nhiều',
            ),
            TabBarElement(
              txtLabel: 'Được xem nhiều',
            ),
            TabBarElement(
              txtLabel: 'Được xem nhiều',
            ),
            TabBarElement(
              txtLabel: 'Được xem nhiều',
            ),
          ],
        ));
  }
}

class TabBarElement extends StatelessWidget {
  const TabBarElement({Key? key, required this.txtLabel}) : super(key: key);
  final String txtLabel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      //margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Color(0xffE7E7E7)))),
      child: Text(
        txtLabel,
      ),
    );
  }
}
