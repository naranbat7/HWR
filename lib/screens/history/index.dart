import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hwr_app/enum/local_storage.dart';
import 'package:hwr_app/model/psycho.dart';
import 'package:hwr_app/services/local_storage/index.dart';
import 'package:hwr_app/widgets/appbar/text_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hwr_app/widgets/card/history_card.dart';
import 'package:hwr_app/widgets/container/line_container.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<PsychoModel> data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    String tmp = await LocalStorage.getItem(PrefsKey.HISTORY.value, "");
    setState(() {
      if (tmp.isNotEmpty) data = PsychoModel.fromList(jsonDecode(tmp));
      data.add(PsychoModel(
        id: 1,
        createdDate: "2021-10-10 14:00:01",
        description: "asd sadsa asd sadsa das ",
        imageUrl: "https://i.pinimg.com/originals/3e/ff/d4/3effd4a1437af491adefa54936d611d7.png",
        personalityType: "ENFJ",
      ));
      data.add(PsychoModel(
        id: 2,
        createdDate: "2021-10-11 14:21:01",
        description: "asd sadsa asd sadsa das ",
        imageUrl: "https://i.pinimg.com/originals/3e/ff/d4/3effd4a1437af491adefa54936d611d7.png",
        personalityType: "ENFJ",
      ));
      data.add(PsychoModel(
        id: 3,
        createdDate: "2021-9-10 14:45:01",
        description: "asd sadsa asd sadsa das ",
        imageUrl: "https://i.pinimg.com/originals/3e/ff/d4/3effd4a1437af491adefa54936d611d7.png",
        personalityType: "ENFJ",
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: TextAppBar(context, title: "history".tr()),
      body: SafeArea(
        child: LineContainerBackground(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                child: Container(height: 1, color: Theme.of(context).errorColor),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, idx) => Padding(
                      padding: EdgeInsets.only(left: width * 0.15, right: width * 0.15, bottom: 15),
                      child: HistoryCard(data[idx]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
