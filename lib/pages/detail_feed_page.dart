import 'package:flutter/material.dart';
import 'package:latis_education/utils/constants.dart';
import 'package:latis_education/widgets/appbar_widget.dart';
import 'package:latis_education/widgets/feed_widget.dart';
import 'package:latis_education/widgets/footer_widget.dart';
import 'package:latis_education/widgets/horizontal_scroll_images.dart';

class DetailFeedPage extends StatelessWidget {
  static const String routeName = "/detail_feed";
  const DetailFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.colorScheme.primary,
          body: ListView(children: [
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
                              Const.margin, Const.margin * 1.5, 0),
                          child: Text(
                            "Home / Feed",
                            style: theme.textTheme.labelSmall
                                ?.copyWith(color: theme.colorScheme.outline),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: Const.margin * 1.5),
                        child: FeedWidget(
                          images: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Const.margin * 1.5),
                            child:
                                Image.asset("assets/images/Illustration.jpg"),
                          ),
                          body:
                              "Cara pertama yang dapat guru lakukan agar murid dapat lebih cepat memahami materi adalah dengan menggunakan mind map. Menurut prinsip Brain Management, konsep mind map dikatakan sesuai dengan kerja alami otak. Mind map dapat membuat kedua belah otak bekerja secara bersamaan dan akan membantu memahami konsep dengan lebih baik. Mind map akan membantu murid melihat konsep materi secara menyeluruh dengan lebih jelas, melihat keterkaitan antara satu bab dengan bab lain, membuat materi menjadi lebih mudah dipahami dengan petunjuk visual, serta membuat belajar menjadi lebih menyenangkan. \n\nTidak hanya untuk murid, membuat mind map juga bisa memberikan banyak manfaat untuk guru, lho. Bapak/Ibu Guru dapat memetakan bahan ajar dengan lebih mudah, memecahkan materi yang rumit menjadi lebih sederhana, dan sebagainya. \n\nSesuaikan metode mengajar dengan teknologi yang semakin berkembang agar proses pemahaman materi menjadi lebih mudah dan cepat. Bapak/Ibu Guru dapat memanfaatkan internet untuk digunakan sebagai sumber materi lain bagi murid dalam mempelajari suatu subjek. Agar tidak mudah bosan, ubahlah teks ke dalam bentuk gambar atau audio. Cara ini akan membuat murid menemukan hal baru yang lebih menyenangkan. Bapak/Ibu Guru juga bisa memberikan pengetahuan mengenai mata pelajaran yang sedang dibahas melalui ruangbelajar. Murid dapat mengakses video pelajaran beranimasi atau membaca artikel terkait di Blog Ruangguru untuk membuat mereka lebih cepat memahami materi.",
                        ),
                      ),
                      const HorizontalScrollImage(
                        size: 257.0,
                      ),
                      const SizedBox(
                        height: Const.margin * 1.5,
                      ),
                      const FooterWidget()
                    ]))
          ])),
    );
  }
}
