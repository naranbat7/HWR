import 'package:flutter/material.dart';
import 'package:hwr_app/model/psycho.dart';
import 'package:hwr_app/screens/success/page2.dart';
import 'package:hwr_app/widgets/container/light_container.dart';

class SuccessPage extends StatefulWidget {
  final PsychoModel data;
  final SuccessPage2 page2;

  SuccessPage(this.data) : this.page2 = SuccessPage2(data.type);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final _controller = PageController();
  bool _started = false;

  _onChanged(int idx) {
    print(idx);
    if (idx > 0 && !_started) {
      widget.page2.forward();
      _started = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).chipTheme.backgroundColor,
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: _onChanged,
          scrollDirection: Axis.vertical,
          children: [
            LightContainerBackground(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/loading.gif',
                      image: widget.data.imageUrl,
                      height: size.height * 0.3,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.data.type.title,
                          style: TextStyle(
                            color: Color(0xff33A574),
                            fontFamily: "Pacifico",
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.data.type.url + "-A / " + widget.data.type.url + "-T",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: "Pacifico",
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "(${widget.data.type.category})",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 20),
                        Image.asset("assets/person.png"),
                      ],
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 30,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            widget.page2,
          ],
        ),
      ),
    );
  }
}
