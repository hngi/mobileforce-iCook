import 'package:flutter/cupertino.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:build_daemon/constants.dart';

void registerCustomDialogUi() {
  var dialogService = locator<DialogService>();


  var selectedOption = ShareOptions.WhatsApp;

  dialogService.registerCustomDialogUi((context, dialogRequest) => Dialog(

    insetPadding: EdgeInsets.fromLTRB(34, 30, 30, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 30,

            top: 30
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Share",
                style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Constants.kbuttonColor1),
              ),
              SizedBox(
                height: 24,
              ),
              ShareRadioButton(
                onChanged: (value){
                  selectedOption = value;
                  print("Selected Option :$selectedOption");
                },

              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      dialogService
                          .completeDialog(DialogResponse(confirmed: false));
                    },
                   child: Padding(padding: EdgeInsets.all(10), child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    )
                  ),
                  SizedBox(
                    width: 38,
                  ),
                  InkWell(
                    onTap: () {
                      dialogService
                          .completeDialog(DialogResponse(confirmed: true,
                        responseData: [
                          selectedOption
                        ]
                      ));
                    },
                    child: Padding(padding: EdgeInsets.all(10), child: Text(
                      "Ok",
                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Constants.kbuttonColor1),
                    ),),
                  ),

                  SizedBox(
                    width: 20,
                  ),

                ],
              ),
            ],
          ),
        ),
      ));
}

enum ShareOptions { WhatsApp, Facebook, Email, Twitter  }

class ShareRadioButton extends StatefulWidget {
  final Function onChanged;

  ShareRadioButton({this.onChanged});

  @override
  _ShareRadioButtonState createState() => _ShareRadioButtonState();
}

class _ShareRadioButtonState extends State<ShareRadioButton> {
  // At the top level:

// In the State of a stateful widget:
  ShareOptions _character = ShareOptions.WhatsApp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RadioListTile<ShareOptions>(
          activeColor: Constants.kbuttonColor1,
          title:  Text('WhatsApp',
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          value: ShareOptions.WhatsApp,
          groupValue: _character,
          onChanged: (ShareOptions value) {
            setState(() {
              _character = value;
            });
            widget.onChanged(value);
          },
        ),
        RadioListTile<ShareOptions>(
          activeColor: Constants.kbuttonColor1,
          title:  Text('Facebook',
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          value: ShareOptions.Facebook,
          groupValue: _character,
          onChanged: (ShareOptions value) {
            setState(() {
              _character = value;
            });
            widget.onChanged(value);
          },
        ),

        RadioListTile<ShareOptions>(
          activeColor: Constants.kbuttonColor1,
          title:  Text('Email',
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          value: ShareOptions.Email,
          groupValue: _character,
          onChanged: (ShareOptions value) {
            setState(() {
              _character = value;
            });
            widget.onChanged(value);
          },
        ),

        RadioListTile<ShareOptions>(
          activeColor: Constants.kbuttonColor1,
          title:  Text('Twitter',
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          value: ShareOptions.Twitter,
          groupValue: _character,
          onChanged: (ShareOptions value) {
            setState(() {
              _character = value;
            });
            widget.onChanged(value);
          },
        ),
      ],
    );
  }
}
