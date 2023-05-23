import 'package:flutter/material.dart';
import 'package:latis_education/pages/home_page.dart';
import 'package:latis_education/utils/constants.dart';
import 'package:latis_education/widgets/account_type_widget.dart';
import 'package:latis_education/widgets/input_widget.dart';

enum AccountType { siswa, tutor }

class LoginPage extends StatefulWidget {
  static const String routeName = "login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AccountType type = AccountType.siswa;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: ListView(
            padding: const EdgeInsets.all(Const.margin),
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 60.0,
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(.2),
                          borderRadius:
                              BorderRadius.circular(Const.radius * 2)),
                      child: Image.asset(
                        "assets/icons/left-arrow 1.png",
                        width: 16.0,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Masuk", style: theme.textTheme.headlineLarge),
                        Container(
                          height: 4.0,
                          width: 120.0,
                          color: theme.colorScheme.primary,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 60.0,
                      height: 48.0,
                    )
                  ],
                ),
              ]),
              const SizedBox(
                height: Const.margin * 1.5,
              ),
              Text(
                "Pilih akun tipe Anda!",
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Const.margin),
              Wrap(
                  spacing: Const.margin,
                  children: List.generate(
                      2,
                      (i) => AccountTypeWidget(
                            active: [
                              type == AccountType.siswa,
                              type == AccountType.tutor
                            ][i],
                            onTap: [
                              () => setState(() => type = AccountType.siswa),
                              () => setState(() => type = AccountType.tutor)
                            ][i],
                            asset: [
                              "assets/images/Siswa.png",
                              "assets/images/Guru.png"
                            ][i],
                          ))),
              const SizedBox(
                height: Const.margin * 2,
              ),
              ...List.generate(
                  2,
                  (i) => InputWidget(
                      label: [
                        "Email/Username ${type == AccountType.siswa ? "siswa" : "tutor"}",
                        "Password ${type == AccountType.siswa ? "siswa" : "tutor"}"
                      ][i],
                      hintText: "Masukkan ${[
                        "email atau username",
                        "password"
                      ][i]} Anda",
                      margin:
                          EdgeInsets.only(bottom: i == 0 ? Const.margin : 0),
                      controller: [emailController, passwordController][i])),
              const SizedBox(
                height: Const.margin * 1.5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.secondary,
                      minimumSize: const Size(200.0, 60.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Const.radius))),
                  onPressed: () =>
                      Navigator.pushNamed(context, HomePage.routeName),
                  child: Text(
                    "Masuk",
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: theme.colorScheme.background),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Lupa password akun?",
                        style: theme.textTheme.labelLarge
                            ?.copyWith(color: theme.colorScheme.onBackground),
                      ),
                      TextSpan(
                        text: " Reset password",
                        style: theme.textTheme.labelLarge,
                      )
                    ]))),
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: theme.colorScheme.outline,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Const.margin * 1.5),
                    child: Text(
                      "Atau",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.shadow),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: theme.colorScheme.outline,
                  ))
                ],
              ),
              const SizedBox(
                height: Const.margin * .4,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset("assets/icons/Google.png"),
                label: Text(
                  "Masuk dengan Google",
                  style: theme.textTheme.labelMedium,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.background,
                    minimumSize: const Size(200.0, 60.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Const.radius))),
              ),
              const SizedBox(
                height: Const.margin * 2,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Belum memiliki akun?",
                        style: theme.textTheme.labelLarge
                            ?.copyWith(color: theme.colorScheme.onBackground),
                      ),
                      TextSpan(
                        text: " Daftar Sekarang",
                        style: theme.textTheme.labelLarge,
                      )
                    ]))),
              ),
            ],
          )),
    );
  }
}
