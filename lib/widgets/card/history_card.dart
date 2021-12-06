import 'package:flutter/material.dart';
import 'package:hwr_app/model/psycho.dart';
import 'package:hwr_app/utils/index.dart';

class HistoryCard extends StatelessWidget {
  final PsychoModel data;

  const HistoryCard(this.data);

  _onPress() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPress,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                data.createdDate != null ? CustomUtils.str2datetime(data.createdDate!) : "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontFamily: "Pacifico",
                ),
              ),
            ),
            Icon(Icons.navigate_next, size: 24),
          ],
        ),
      ),
    );
  }
}
