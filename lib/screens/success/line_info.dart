import 'package:flutter/material.dart';

class LineInfo extends StatefulWidget {
  final String title, description;
  final int percent;
  final Color color;
  final _state = _LineInfoState();

  LineInfo({required this.title, required this.description, required this.percent, required this.color});

  forward() {
    _state.forward();
  }

  @override
  _LineInfoState createState() => _state;
}

class _LineInfoState extends State<LineInfo> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = IntTween(begin: widget.percent < 50 ? 100 : 0, end: widget.percent).animate(new CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animation.addListener(() => setState(() {}));
  }

  forward() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    bool isLow = widget.percent < 50;
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        Text(
          widget.description,
          style: TextStyle(
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Row(
          children: [
            SizedBox(
              width: 50,
              child: Text("${_animation.value}%"),
            ),
            Expanded(
              flex: _animation.value as int,
              child: _line(isLow ? Color(0xfff5f5f5) : widget.color, true),
            ),
            Expanded(
              flex: (100 - _animation.value as int),
              child: _line(!isLow ? Color(0xfff5f5f5) : widget.color, false),
            ),
            SizedBox(
              width: 50,
              child: Text("${100 - _animation.value as int}%", textAlign: TextAlign.right),
            ),
          ],
        )
      ],
    );
  }

  Widget _line(color, isLeft) {
    var radius = Radius.circular(8);
    var radius0 = Radius.zero;
    return Container(
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: isLeft ? radius : radius0,
          bottomRight: isLeft ? radius0 : radius,
          topLeft: isLeft ? radius : radius0,
          topRight: isLeft ? radius0 : radius,
        ),
        color: color,
      ),
    );
  }
}
