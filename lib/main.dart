import 'package:flutter/material.dart';
import 'package:latis_education/pages/add_post_page.dart';
import 'package:latis_education/pages/detail_feed_page.dart';
import 'package:latis_education/pages/feed_page.dart';
import 'package:latis_education/pages/home_page.dart';
import 'package:latis_education/pages/login_page.dart';
import 'package:latis_education/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.themeData,
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
        FeedPage.routeName: (context) => const FeedPage(),
        DetailFeedPage.routeName: (context) => const DetailFeedPage(),
        AddPostPage.routeName: (context) => const AddPostPage()
      },
    );
  }
}
