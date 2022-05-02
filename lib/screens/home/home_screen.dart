import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/book.dart';
import 'components/bottom_appbar.dart';
import 'components/tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexTabBottomAppBar = 0;
  void _selectedTab(int index) {
    setState(() {
      indexTabBottomAppBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        onTabSelected: _selectedTab,
        height: 60,
        iconSize: 19,
        items: [
          CustomBottomAppBarItem(
              text: "Giải toả", svgPath: "assets/images/coffeeico.svg"),
          CustomBottomAppBarItem(
              text: "Tự chọn", svgPath: "assets/images/categoryicon.svg"),
          CustomBottomAppBarItem(
              text: "Dạo nhà sách", svgPath: "assets/images/bookicon.svg"),
          CustomBottomAppBarItem(
              text: "Thư viện", svgPath: "assets/images/bookicon2.svg"),
          CustomBottomAppBarItem(
              text: "Tư Vấn", svgPath: "assets/images/chaticon.svg"),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * .35,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5CEB8),
                    image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: ExactAssetImage("assets/images/image12.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/Logo.svg",
                            width: 59,
                            height: 35,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  " Tềm năng",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  " Mater",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        "danh muc",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          const TabBarCusTom(),
          // body
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
              ),
              itemCount: listBook.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(listBook[index].pathImage),
                    Text(
                      listBook[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
