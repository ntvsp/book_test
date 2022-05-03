import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  int indexSeletedTabBottomAppBar = 0;
  Set indexSeletedCategories = <int>{};
  void _selectedTab(int index) {
    setState(() {
      indexSeletedTabBottomAppBar = index;
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
                        mainAxisSize: MainAxisSize.max,
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
                      const SizedBox(
                        height: 70,
                      ),
                      const SizedBox(
                        height: 30,
                        child: Text(
                          "Chọn 3 danh mục",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: MasonryGridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 10,
                          itemCount: listCategory.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => setState(() {
                                indexSeletedCategories.contains(index)
                                    ? indexSeletedCategories.remove(index)
                                    : indexSeletedCategories.add(index);
                              }),
                              child: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      color:
                                          indexSeletedCategories.contains(index)
                                              ? const Color(0xffFF9F00)
                                              : Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            child: Image.asset(
                                              listCategory[index].pathImage,
                                              height: 16,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                            text: listCategory[index].title,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          const TabBarCusTom(),
          // body
          indexSeletedCategories.length >= 3
              ? body()
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Search-rafiki 1.png"),
                      const Text(
                        "Lưa chọn 3 danh mục để tìm kiếm",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Expanded body() {
    return Expanded(
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
    );
  }
}
