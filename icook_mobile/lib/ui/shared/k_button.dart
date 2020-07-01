import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Color buttonColor;
  final Color textColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 335,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: buttonColor,
        textColor: textColor,
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 20),
        ),
      ),
    );
  }
}
