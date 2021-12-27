import 'package:crud_application/config/color.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {

  var text;
  var press;

  RedButton.FlatButton({
    this.text,
    this.press
  });
  @override
  Widget build(BuildContext context) {
    return newFlatButton(context);
  }

  Widget newFlatButton(context){
    Size size = MediaQuery.of(context).size;
    return FlatButton(
      minWidth: size.width,
      color: Colors.red,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child: Text(text,
        style: buttonText,),
      onPressed: press,
    );
  }
}