// Copyright 2023 BenderBlog Rodriguez and contributors.
// SPDX-License-Identifier: MPL-2.0

import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:watermeter/page/setting/dialogs/sport_password_dialog.dart';
import 'package:watermeter/page/sport/sport_window.dart';
import 'package:watermeter/repository/preference.dart' as preference;
import 'package:watermeter/page/homepage/toolbox/small_function_card.dart';

class SportCard extends StatelessWidget {
  const SportCard({super.key});
  @override
  Widget build(BuildContext context) {
    return SmallFunctionCard(
      onTap: () async {
        bool isGood = true;
        if (preference.getString(preference.Preference.sportPassword).isEmpty) {
          isGood = await showDialog(
            context: context,
            builder: (context) => const SportPasswordDialog(),
          );
        }
        if (context.mounted && isGood) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SportWindow(),
            ),
          );
        }
      },
      icon: MingCuteIcons.mgc_run_fill,
      name: "体育信息",
      description: "查看体育成绩",
    );
  }
}
