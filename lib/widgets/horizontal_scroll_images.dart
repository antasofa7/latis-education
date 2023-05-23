import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latis_education/utils/constants.dart';

class HorizontalScrollImage extends StatelessWidget {
  final double? size;
  final bool addImage;
  const HorizontalScrollImage({super.key, this.size, this.addImage = false});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: size ?? 136.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            3,
            (y) => Padding(
                  padding: EdgeInsets.only(
                      right: y != 2 ? 0 : Const.margin * 1.5,
                      left: size != null && size! > 200
                          ? Const.margin * 1.5
                          : y == 0
                              ? Const.margin * 1.5
                              : 12.0),
                  child: y == 0 && addImage
                      ? Container(
                          width: 136.0,
                          height: 136.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.outlineVariant,
                              borderRadius:
                                  BorderRadius.circular(Const.radius)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/PDF.svg",
                                width: 20.0,
                              ),
                              const SizedBox(
                                height: Const.margin * .5,
                              ),
                              Text(
                                "Portofolio-Jihan.pdf",
                                style: theme.textTheme.bodySmall,
                              )
                            ],
                          ),
                        )
                      : Image.asset(
                          "assets/images/Image.jpg",
                          height: size ?? 136.0,
                        ),
                )),
      ),
    );
  }
}
