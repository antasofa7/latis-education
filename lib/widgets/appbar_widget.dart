import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends AppBar {
  final Widget? titleAppbar;
  final Widget? backButton;
  final Widget? actionButton;

  AppBarWidget({
    super.key,
    this.titleAppbar,
    this.backButton,
    this.actionButton,
  });

  @override
  bool get automaticallyImplyLeading => backButton != null;
  @override
  Widget? get leading => backButton;

  @override
  double? get toolbarHeight => 70.0;
  @override
  Widget? get title =>
      titleAppbar ??
      Image.asset(
        "assets/icons/Logo.png",
        height: 25.0,
      );
  @override
  Color? get backgroundColor => Colors.transparent;
  @override
  double? get elevation => 0;
  @override
  List<Widget>? get actions => [
        actionButton ??
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/Bell.svg",
                width: 24.0,
              ),
            ),
      ];
}
