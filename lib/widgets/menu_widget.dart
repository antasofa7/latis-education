import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latis_education/utils/constants.dart';

class MenuWidget extends StatelessWidget {
  final String label, icon;
  final Color? color;
  final bool round;
  final void Function() onPress;
  const MenuWidget(
      {super.key,
      required this.label,
      required this.icon,
      this.color,
      this.round = true,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(round ? 15.0 : 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: round
                  ? theme.colorScheme.outlineVariant
                  : theme.colorScheme.background,
            ),
            child: SvgPicture.asset(
              "assets/icons/$icon.svg",
              width: 26.0,
              color: color,
            ),
          ),
          const SizedBox(
            height: Const.margin * .5,
          ),
          Text(
            label,
            style: theme.textTheme.labelMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
