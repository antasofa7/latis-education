import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latis_education/utils/constants.dart';

class AccountWidget extends StatelessWidget {
  final String avatar, name, desc;
  final bool more;
  final Color? textColor;
  const AccountWidget({
    super.key,
    this.avatar = "User_1",
    this.name = "Kak Jihan",
    this.desc = "",
    this.more = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      leading: Image.asset(
        "assets/images/$avatar.png",
        width: 46.0,
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(
        name,
        style: theme.textTheme.titleMedium
            ?.copyWith(color: textColor ?? theme.colorScheme.onBackground),
      ),
      subtitle: desc != ""
          ? Row(children: [
              more
                  ? const SizedBox()
                  : SvgPicture.asset(
                      "assets/icons/Marker.svg",
                      width: 12.0,
                    ),
              const SizedBox(
                width: Const.margin * .4,
              ),
              Text(desc,
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: textColor ?? theme.colorScheme.shadow))
            ])
          : const SizedBox(),
      trailing: more
          ? IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/More.svg",
                width: 24.0,
              ),
            )
          : const SizedBox(),
    );
  }
}
