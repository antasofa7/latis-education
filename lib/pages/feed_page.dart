import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latis_education/pages/add_post_page.dart';
import 'package:latis_education/utils/constants.dart';
import 'package:latis_education/widgets/account_widget.dart';
import 'package:latis_education/widgets/appbar_widget.dart';
import 'package:latis_education/widgets/feed_widget.dart';
import 'package:latis_education/widgets/footer_widget.dart';

enum FeedType { tutor, saya }

class FeedPage extends StatefulWidget {
  static const String routeName = "/feed";
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  FeedType type = FeedType.tutor;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: ListView(
          children: [
            AppBarWidget(),
            Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Const.radius),
                      topRight: Radius.circular(Const.radius))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(Const.margin * 1.5,
                          Const.margin, Const.margin * 1.5, Const.margin * 1.5),
                      child: Text(
                        "Home / Feed",
                        style: theme.textTheme.labelSmall
                            ?.copyWith(color: theme.colorScheme.outline),
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(Const.radius * .5)),
                    child: Row(
                      children: List.generate(
                          2,
                          (x) => Expanded(
                                child: ElevatedButton(
                                  onPressed: [
                                    () => setState(() => type = FeedType.tutor),
                                    () => setState(() => type = FeedType.saya)
                                  ][x],
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: const Size.fromHeight(50.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              Const.radius * .5)),
                                      backgroundColor: [
                                        type == FeedType.tutor
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.outlineVariant,
                                        type == FeedType.saya
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.outlineVariant,
                                      ][x]),
                                  child: Text(["Feed Tutor", "Feed Saya"][x],
                                      style:
                                          theme.textTheme.labelMedium?.copyWith(
                                              color: [
                                        type == FeedType.tutor
                                            ? theme.colorScheme.surface
                                            : theme.colorScheme.primary,
                                        type == FeedType.saya
                                            ? theme.colorScheme.surface
                                            : theme.colorScheme.primary,
                                      ][x])),
                                ),
                              )),
                    ),
                  ),
                  FeedWidget(
                    images: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Const.margin * 1.5),
                      child: Image.asset("assets/images/Illustration.jpg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Const.margin * 1.5, vertical: 0),
                    child: Divider(color: theme.colorScheme.outline),
                  ),
                  const FeedWidget(
                    avatar: "User2",
                    name: "Kak Nada",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Const.margin * 1.5, vertical: 0),
                    child: Divider(color: theme.colorScheme.outline),
                  ),
                  FeedWidget(
                    images: Image.asset("assets/images/Illustration.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Const.margin * 1.5, vertical: 0),
                    child: Divider(color: theme.colorScheme.outline),
                  ),
                  const FeedWidget(
                    avatar: "User2",
                    name: "Kak Nada",
                  ),
                ],
              ),
            ),
            const FooterWidget()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.background,
          onPressed: () => Navigator.pushNamed(context, AddPostPage.routeName),
          child: SvgPicture.asset(
            "assets/icons/Plus.svg",
            width: 38.0,
          ),
        ),
      ),
    );
  }
}
