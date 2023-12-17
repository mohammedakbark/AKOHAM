import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Widget BlankTextField(
    {context,
    TextEditingController? controller,
    hintText,
    double? fielSize,
    maxline,
    String? Function(String?)? validator,
    maxLength}) {
  return SizedBox(
    width: fielSize ?? MediaQuery.of(context).size.width * .4,
    child: TextFormField(
      // maxLength: maxLength,
      
      validator: validator,
      maxLines: maxline,
      controller: controller,
      decoration: InputDecoration(
          hintStyle: GoogleFonts.jua(),
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: const UnderlineInputBorder()),
    ),
  );
}
