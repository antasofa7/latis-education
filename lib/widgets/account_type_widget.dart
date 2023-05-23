import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../utils/constants.dart';

class AccountTypeWidget extends StatelessWidget {
  final bool active;
  final Function() onTap;
  final String asset;
  const AccountTypeWidget(
      {super.key,
      required this.active,
      required this.onTap,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(30.0),
            margin: const EdgeInsets.only(bottom: 20.0),
            width: MediaQuery.of(context).size.width / 2 - (Const.margin * 1.5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: active
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline),
                borderRadius: BorderRadius.circular(30.0)),
            child: Column(
              children: [Image.asset(asset)],
            ),
          ),
          active
              ? Positioned(
                  bottom: 0,
                  right: 8.0,
                  child: Image.asset(
                    "assets/icons/checked.png",
                    width: 50.0,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
