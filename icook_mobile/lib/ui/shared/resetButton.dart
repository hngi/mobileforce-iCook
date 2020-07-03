import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/ui_helper.dart';

class ResetButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final Function onPressed;
  final bool isEnabled;

  const ResetButton(
      {Key key,
      this.title,
      this.buttonColor,
      this.textColor,
      this.onPressed,
      this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 334,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Constants.kbuttonColor1,
        textColor: Colors.white,
        disabledColor: Constants.kbuttonColor2,
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
