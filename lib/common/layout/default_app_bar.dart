import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/const/colors.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const defaultAppBarHeight = 60.0;
  final String title;
  final List<Widget>? action;
  final Widget? leading;
  final double? elevation;

  const DefaultAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.action,
    this.elevation,
  }) : super(key: key);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize =>
      const Size(double.infinity, DefaultAppBar.defaultAppBarHeight);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: MyColor.text,
        ),
      ),
      leading: widget.leading,
      centerTitle: true,
      actions: widget.action,
      elevation: widget.elevation ?? 0.3,
      backgroundColor: MyColor.white,
      foregroundColor: MyColor.text,
    );
  }
}
