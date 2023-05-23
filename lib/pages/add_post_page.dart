import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latis_education/utils/constants.dart';
import 'package:latis_education/widgets/account_widget.dart';
import 'package:latis_education/widgets/appbar_widget.dart';
import 'package:latis_education/widgets/horizontal_scroll_images.dart';

class AddPostPage extends StatefulWidget {
  static const String routeName = "/add_post";
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: AppBarWidget(
                backButton: BackButton(
                  style: IconButton.styleFrom(padding: EdgeInsets.zero),
                ),
                titleAppbar: Text(
                  "Bagikan Postingan",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: theme.colorScheme.background),
                ),
                actionButton: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Posting".toUpperCase(),
                      style: theme.textTheme.labelLarge
                          ?.copyWith(color: theme.colorScheme.background),
                    )),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height - 70.0,
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Const.radius),
                        topRight: Radius.circular(Const.radius))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Const.margin * 1.5),
                        child: AccountWidget(),
                      ),
                      const HorizontalScrollImage(
                        addImage: true,
                      ),
                      const SizedBox(
                        height: Const.margin * 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Const.margin * 1.5),
                        child: Column(
                          children: [
                            TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                  hintText:
                                      "Bagikan modul,bahan ajar, kunci jawaban, foto, video mengajar, nilai siswa, portofolio mengajar kakak di sini",
                                  hintStyle: theme.textTheme.bodyMedium
                                      ?.copyWith(
                                          color: theme.colorScheme.outline),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.outline,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(Const.radius)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.outline,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(Const.radius))),
                            ),
                            const SizedBox(
                              height: Const.margin * .5,
                            ),
                            ...List.generate(
                                2,
                                (x) => Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: theme.colorScheme
                                                      .outlineVariant))),
                                      child: ListTile(
                                        leading: SvgPicture.asset(
                                          "assets/icons/${[
                                            "Camera",
                                            "Attach"
                                          ][x]}.svg",
                                          width: 22.0,
                                        ),
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          [
                                            "Tambah Foto / Video",
                                            "Tambah File"
                                          ][x],
                                          style: theme.textTheme.labelSmall
                                              ?.copyWith(
                                                  color: theme.colorScheme
                                                      .onBackground),
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
