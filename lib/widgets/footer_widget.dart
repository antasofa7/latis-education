import 'package:flutter/material.dart';
import 'package:latis_education/utils/constants.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Const.margin * 1.5),
      color: theme.colorScheme.primary,
      alignment: Alignment.center,
      child: Text(
        "© 2020 LATIS EDUCATION",
        style: theme.textTheme.titleSmall
            ?.copyWith(color: theme.colorScheme.surface),
      ),
    );
  }
}
