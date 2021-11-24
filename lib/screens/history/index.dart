import 'package:flutter/material.dart';
import 'package:hwr_app/widgets/appbar/text_appbar.dart';
import 'package:easy_localization/easy_localization.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(context, title: "history".tr(),),
      body: SafeArea(child: Container(

      ),),
    );
  }
}
