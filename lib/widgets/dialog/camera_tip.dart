import 'package:flutter/material.dart';
import 'package:hwr_app/enum/local_storage.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/services/local_storage/index.dart';
import 'package:hwr_app/widgets/button/main_button.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

class CameraTipDialog extends StatefulWidget {
  @override
  _CameraTipDialogState createState() => _CameraTipDialogState();
}

class _CameraTipDialogState extends State<CameraTipDialog> {
  final double _lottieHeight = 150;
  bool _isChecked = false;

  _onPressCheck() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  _onSubmit() {
    if (_isChecked) LocalStorage.getItem(PrefsKey.TIP.value, "true");
    Navigator.pop(context);
    Navigator.pushNamed(context, RouteName.CAMERA);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Transform.translate(
                  offset: Offset(0, -_lottieHeight * 0.67),
                  child: Lottie.asset("assets/lottie/question.json", height: _lottieHeight),
                ),
                Column(
                  children: [
                    SizedBox(height: _lottieHeight / 3.5),
                    Text(
                      "cameraTip.head".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "cameraTip.body".tr(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: _onPressCheck,
                      child: Row(
                        children: [
                          Icon(
                            _isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "cameraTip.skip".tr(),
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    MainButton(
                      title: "continue".tr(),
                      onPress: _onSubmit,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
