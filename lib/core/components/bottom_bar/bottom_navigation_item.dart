import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';

typedef SelectMenuItem = Function(CustomNavigationItem);

class CustomBottomBar extends StatefulWidget {
  final List<CustomNavigationItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;

  final Color selectedColor;
  final int selectedIndex;
  final SelectMenuItem selectMenuItem;

  CustomBottomBar({
    Key? key,
    required this.items,
    required this.height,
    required this.iconSize,
    required this.backgroundColor,
    required this.selectedColor,
    required this.selectedIndex,
    required this.selectMenuItem,
  }) : super(key: key) {
    assert(items.length > 1);
  }

  @override
  CustomBottomBarState createState() {
    return CustomBottomBarState();
  }
}

class CustomBottomBarState extends State<CustomBottomBar> {
  final List<GlobalKey> _keys = [];

  @override
  void initState() {
    for (final _ in widget.items) {
      _keys.add(GlobalKey());
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final double _dotSize = 2.5;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: widget.height,
      color: widget.backgroundColor,
      elevation: 0.0,
      padding: EdgeInsets.zero,
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        padding: const EdgeInsets.only(
          left: 11,
          right: 11,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.items.map((e) {
                  int loc = widget.items.indexOf(e);
                  return _buildItem(
                      key: _keys.elementAt(loc),
                      item: e,
                      isSelected: loc == widget.selectedIndex,
                      index: loc,
                      onPressed: () async {
                        await widget.selectMenuItem(e);
                      });
                }).toList()
              ],
            ),
            Builder(
              builder: (context) {
                GlobalKey key = _keys.elementAt(widget.selectedIndex);
                Offset? childRelativeToParent;
                Offset? itemOffset;
                Rect? itemRect;
                try {
                  RenderBox item = key.currentContext?.findRenderObject() as RenderBox;
                  itemOffset = item.localToGlobal(Offset.zero);
                  itemRect = item.paintBounds;
                  RenderBox parent = item.parent as RenderBox;
                  debugPrint(itemOffset.toString());
                  Offset parentOffset = parent.localToGlobal(Offset.zero);
                  debugPrint(parentOffset.toString());
                  childRelativeToParent = parent.globalToLocal(itemOffset);
                  debugPrint(childRelativeToParent.toString());
                } catch (err) {
                  itemRect = const Rect.fromLTRB(0, 0, 0, 0);
                }
                if (childRelativeToParent == null) {
                  return Container();
                }
                return TweenAnimationBuilder<double>(
                  tween: Tween(end: childRelativeToParent.dx + (itemRect.width / 2) - _dotSize),
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 300),
                  builder: (context, t, _) {
                    return Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                        color: widget.selectedColor,
                      ),
                      alignment: AlignmentDirectional.topStart,
                      margin: EdgeInsets.only(
                        left: t - 15,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required GlobalKey key,
    required CustomNavigationItem item,
    required int index,
    required bool isSelected,
    required Function onPressed,
  }) {
    return Material(
      key: key,
      type: MaterialType.transparency,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => onPressed(),
        child: SizedBox(
          height: 40,
          width: 40,
          child: TweenAnimationBuilder<double>(
            tween: Tween(
              end: isSelected ? 0.0 : 10.0,
            ),
            curve: Curves.linear,
            duration: const Duration(milliseconds: 500),
            builder: (context, t, _) {
              return Container(
                height: 40,
                width: 40,
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.only(
                  top: t + 12,
                ),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Icon(
                    item.icon,
                    color: isSelected ? widget.selectedColor : ColorConstant.kPrimary500Color,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomNavigationItem {
  final String initialLocation;
  final IconData icon;
  CustomNavigationItem({required this.initialLocation, required this.icon});
}
