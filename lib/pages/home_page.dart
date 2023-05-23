import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latis_education/pages/add_post_page.dart';
import 'package:latis_education/pages/feed_page.dart';
import 'package:latis_education/styles/theme.dart';
import 'package:latis_education/utils/constants.dart';
import 'package:latis_education/widgets/account_widget.dart';
import 'package:latis_education/widgets/appbar_widget.dart';
import 'package:latis_education/widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.outlineVariant,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 265.0,
              automaticallyImplyLeading: false,
              flexibleSpace: PreferredSize(
                preferredSize: const Size(double.infinity, 254.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(Const.margin * 1.5, 0,
                      Const.margin * 1.5, Const.margin * 1.5),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/header.png"))),
                  child: Column(children: [
                    AppBarWidget(),
                    AccountWidget(
                      desc: "Cibinong",
                      textColor: theme.colorScheme.background,
                    ),
                    const SizedBox(
                      height: Const.margin,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 42.0, vertical: Const.margin),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(Const.radius)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            3,
                            (x) => MenuWidget(
                                  label: ["Profile", "Presensi", "History"][x],
                                  icon: [
                                    "Account",
                                    "In_Progress",
                                    "Activity_History"
                                  ][x],
                                  color: theme.colorScheme.primary,
                                  round: false,
                                  onPress: () {},
                                )),
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 250.0,
                padding: const EdgeInsets.symmetric(
                    horizontal: 48.0, vertical: Const.margin),
                margin: const EdgeInsets.symmetric(vertical: Const.margin * .4),
                color: theme.colorScheme.background,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: Const.margin,
                  children: List.generate(
                      6,
                      (i) => MenuWidget(
                            label: [
                              "Jadwal",
                              "Gaji",
                              "Bukti Pembayaran",
                              "Modul",
                              "Daily Tutoring",
                              "Feed"
                            ][i],
                            icon: [
                              "Calendar",
                              "Wallet",
                              "Receipt",
                              "Folder",
                              "Teaching",
                              "Portfolio"
                            ][i],
                            onPress: i != 5
                                ? () {}
                                : () => Navigator.pushNamed(
                                    context, FeedPage.routeName),
                          )),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 24.0),
                margin: const EdgeInsets.only(bottom: 4.0),
                color: theme.colorScheme.background,
                child: Column(
                  children: [
                    Text(
                      "Test Online".toUpperCase(),
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: const Color(0xff4D768A),
                          fontWeight: Themes.bold),
                    ),
                    const SizedBox(
                      height: Const.margin,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/Report_Card.svg",
                        width: 24.0,
                      ),
                      label: Text(
                        "Test Online Sekarang",
                        style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.background,
                            fontWeight: Themes.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          minimumSize: const Size(double.infinity, 50.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Const.radius * .5))),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                tileColor: theme.colorScheme.background,
                contentPadding: const EdgeInsets.all(24.0),
                minVerticalPadding: Const.margin * .8,
                title: Text(
                  "Daily Report",
                  style: theme.textTheme.titleSmall,
                ),
                subtitle: Text(
                  "Real time report belajar siswa, wajib diisi setiap pertemuan ya kak!",
                  style: theme.textTheme.bodySmall,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: ElevatedButton.icon(
          onPressed: () => Navigator.pushNamed(context, AddPostPage.routeName),
          icon: SvgPicture.asset(
            "assets/icons/Plus.svg",
            width: 24.0,
          ),
          label: Text(
            "Posting",
            style:
                theme.textTheme.labelLarge?.copyWith(fontWeight: Themes.medium),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(130.0, 46.0),
              elevation: 3,
              backgroundColor: theme.colorScheme.surface,
              shape: const StadiumBorder()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            elevation: 2,
            onTap: (index) => setState(() => _selectedIndex = index),
            selectedItemColor: theme.colorScheme.primary,
            items: List.generate(
                5,
                (y) => _bottomNavItem(
                    icon: ["Home", "Search", "Go", "Sum", "Account"][y]))),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem({required String icon}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/$icon.svg",
          width: 24.0,
        ),
        label: "");
  }
}
