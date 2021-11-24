import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const MainButton({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).errorColor),
        minimumSize: MaterialStateProperty.all(Size(200, 50)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      ),
      onPressed: onPress,
      child: Text(title),
    );
  }
}
