import 'package:flutter/material.dart';
import 'package:flutter_kurdish_localization/classes/language.dart';
import 'package:flutter_kurdish_localization/localization/language_constants.dart';
import 'package:flutter_kurdish_localization/router/route_constants.dart';
import 'package:flutter_kurdish_localization/util/constants.dart';
import 'package:flutter_kurdish_localization/util/custom_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../landing.dart';
import '../main.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  void _changeLanguage(String language) async {
    Locale _locale = await setLocale(language);
    MyApp.setLocale(context, _locale);
  }

  final List<Language> _grid = Language.languageList();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomContainer(
              alignment: Alignment.center,
              child: Text(
                getTranslated(context, 'change_language'),
                style: const TextStyle(color: primaryColor),
              )),
          CustomContainer(
            child: Column(
              children: [
                Text(
                  getTranslated(context, 'select_language'),
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      final e = _grid[i];
                      return LanguageItems(
                        title: e.name,
                        code: e.languageCode,
                        flag: e.flag,
                        onPressed: () {
                          _changeLanguage(e.languageCode);
                        },
                      );
                    }),
                const SizedBox(height: 10),
              ],
            ),
          ),
          CustomContainer(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    getTranslated(context, 'rm_shared'),
                    style: const TextStyle(color: primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: OutlinedButton(
                      child: Text(
                        getTranslated(context, 'delete'),
                        style: const TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        SharedPreferences _prefs =
                            await SharedPreferences.getInstance();

                        _prefs.remove('landing');

                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(
                            message: getTranslated(context, 'deleted'),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
          CustomContainer(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    "Landing Screen",
                    style: TextStyle(color: primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: OutlinedButton(
                      child: const Text(
                        "Route",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, landingRoute);
                      },
                    ),
                  )
                ],
              )),
          const CustomContainer(
              alignment: Alignment.center,
              child: Text(
                "Amin Samad \n Thanks to dawand & Arin Faraj",
                style: TextStyle(color: primaryColor),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
