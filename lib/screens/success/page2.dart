import 'package:flutter/material.dart';
import 'package:hwr_app/model/result.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/screens/success/line_info.dart';
import 'package:hwr_app/widgets/button/main_button.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessPage2 extends StatelessWidget {
  final ResultModel data;
  final List<LineInfo> lines;

  SuccessPage2(this.data)
      : this.lines = [
          LineInfo(
              title: "Mind",
              description: "This trait determines how we interact with our environment.",
              percent: data.mind,
              color: Color(0xff4298b4)),
          LineInfo(
              title: "Energy",
              description: "This trait shows where we direct our mental energy.",
              percent: data.energy,
              color: Color(0xffe4ae3a)),
          LineInfo(
              title: "Nature",
              description: "This trait determines how we make decisions and cope with emotions.",
              percent: data.nature,
              color: Color(0xff33a474)),
          LineInfo(
              title: "Tactics",
              description: "This trait reflects our approach to work, planning and decision-making.",
              percent: data.tactics,
              color: Color(0xff88619a)),
          LineInfo(
              title: "Identity",
              description:
                  "This trait underpins all others, showing how confident we are in our abilities and decisions.",
              percent: data.identity,
              color: Color(0xfff25e62)),
        ];

  forward() {
    lines.forEach((e) {
      e.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Expanded(child: Image.asset("assets/psycho/" + data.url + ".png")),
          SizedBox(height: 10),
          Column(children: lines),
          SizedBox(height: 40),
          MainButton(
            title: "retry".tr(),
            onPress: () => Navigator.popUntil(context, ModalRoute.withName(RouteName.HOME)),
          ),
        ],
      ),
    );
  }
}
