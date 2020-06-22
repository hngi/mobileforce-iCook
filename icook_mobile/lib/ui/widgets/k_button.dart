
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key key,
    this.title,
    this.buttonColor,
    this.textColor,
  }) : super(key: key);

  final String title;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: buttonColor,
        textColor: textColor,
        onPressed: () {},
        child: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 20),
        ),
      ),
    );
  }
}
