import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey[100],
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 40.0,
          child: Text(text),
        ),
      ),
    );
  }
}