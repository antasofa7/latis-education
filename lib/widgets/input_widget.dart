import 'package:flutter/material.dart';
import 'package:latis_education/utils/constants.dart';

class InputWidget extends StatelessWidget {
  final String label, hintText;
  final TextEditingController controller;
  final TextInputType type;
  final EdgeInsetsGeometry margin;
  const InputWidget(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      this.type = TextInputType.name,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium,
          ),
          const SizedBox(
            height: Const.margin * .5,
          ),
          TextFormField(
            controller: controller,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                  borderSide: BorderSide(color: theme.colorScheme.outline)),
            ),
          ),
        ],
      ),
    );
  }
}
