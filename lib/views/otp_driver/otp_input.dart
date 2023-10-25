import 'package:flutter/material.dart';

import '../../constantsss/app_theme/app_color.dart';

//import '../../constants/app_theme/app_color.dart';
//import 'package:roshini/constants/app_theme/app_color.dart';

class OtpInput extends StatelessWidget {
  const OtpInput(
      {Key? key,
      required this.controller,
      required this.autoFocus,
      required this.validator})
      : super(key: key);
  final bool autoFocus;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: SizedBox(
        height: size.height * 0.09,
        width: size.width * 0.18,
        child: PhysicalModel(
          color: Color(0xfff5f5f5),
          //shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(10),
          elevation: 3,
          child: Container(
            height: size.height * 0.06,
            width: size.width * 0.15,
            //height: 120,
            //width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xfff5f5f5), width: 0),
              //shape: BoxShape.circle,
              color: MyTheme.ambapp12,
              //color: Color(0xfff5f5f5),

              //borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.014),
              child: TextFormField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: MyTheme.ambapp,
                ),
                cursorColor: MyTheme.ambapp,
                cursorWidth: 3,
                cursorHeight: 27,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.00,
                      horizontal: size.width * 0.02),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(fontSize: 25.0, color: Colors.grey),
                  counterText: '',
                  focusColor: Colors.black,
                ),
                autofocus: autoFocus,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: controller,
                validator: validator,
                maxLength: 1,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
