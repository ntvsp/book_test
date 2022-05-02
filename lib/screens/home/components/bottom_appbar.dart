import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomAppBarItem {
  CustomBottomAppBarItem(
      {this.iconData = Icons.search, this.text = '', this.svgPath});
  IconData iconData;
  String? svgPath;
  String text;
}

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    Key? key,
    required this.items,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.white,
    this.color = Colors.black,
    this.selectedColor = const Color(0xffFF9F00),
    this.notchedShape,
    required this.onTabSelected,
  }) : super(key: key);
  final List<CustomBottomAppBarItem> items;

  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 2;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    required CustomBottomAppBarItem item,
    required int index,
    ValueChanged<int>? onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index),
            child: Container(
              decoration: _selectedIndex == index
                  ? BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: widget.selectedColor)))
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  item.svgPath != null
                      ? SvgPicture.asset(
                          item.svgPath!,
                          color: color,
                          height: widget.iconSize,
                        )
                      : Icon(item.iconData,
                          color: color, size: widget.iconSize),
                  Text(
                    item.text,
                    style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
