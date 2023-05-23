import 'package:flutter/material.dart';
import 'package:latis_education/pages/detail_feed_page.dart';
import 'package:latis_education/utils/constants.dart';
import 'package:latis_education/widgets/account_widget.dart';
import 'package:latis_education/widgets/horizontal_scroll_images.dart';

class FeedWidget extends StatelessWidget {
  final String? avatar, name, time, title, body;
  final Widget? images;
  const FeedWidget(
      {super.key,
      this.avatar,
      this.name,
      this.time,
      this.title,
      this.body,
      this.images});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
        top: Const.margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Const.margin * 1.5),
            child: AccountWidget(
              avatar: avatar ?? "User_1",
              name: name ?? "Kak Jihan",
              desc: time ?? "12 menit yang lalu",
              more: true,
            ),
          ),
          const SizedBox(
            height: Const.margin,
          ),
          images ?? const HorizontalScrollImage(),
          const SizedBox(
            height: Const.margin,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "5 Cara Mengajar agar Murid Cepat Paham",
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: theme.colorScheme.onBackground),
                ),
                const SizedBox(
                  height: Const.margin * .5,
                ),
                Text(
                  body ??
                      "Cara pertama yang dapat guru lakukan agar murid dapat lebih cepat memahami materi adalah dengan menggunakan mind map. Menurut prinsip Brain...",
                  style: theme.textTheme.bodyMedium,
                ),
                body != null && body!.length > 100
                    ? const SizedBox()
                    : TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () => Navigator.pushNamed(
                            context, DetailFeedPage.routeName),
                        child: Text(
                          "Lihat Selengkapnya",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.primary),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
