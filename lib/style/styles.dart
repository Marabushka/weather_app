import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesText {
  TextStyle weeknameStyle = GoogleFonts.ubuntu(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle cityStyle = GoogleFonts.ubuntu(
    fontSize: 45,
    color: Colors.white,
  );

  TextStyle cityTempStyle = GoogleFonts.ubuntu(
      fontSize: 70, color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle cityParametrsStyle = GoogleFonts.ubuntu(
    fontSize: 15,
    color: Colors.white.withOpacity(0.9),
  );

  TextStyle cityParametrsBoldStyle = GoogleFonts.ubuntu(
      fontSize: 15,
      color: Colors.white.withOpacity(0.9),
      fontWeight: FontWeight.bold);

  TextStyle cityHourParametrsBoldStyle = GoogleFonts.ubuntu(
      fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold);

  TextStyle cityHourParametrsStyle = GoogleFonts.ubuntu(
    fontSize: 25,
    color: Colors.white,
  );

  TextStyle buttonStyle = GoogleFonts.ubuntu(
    fontSize: 25,
    color: Colors.white,
  );

  TextStyle forecastParamsStyle = GoogleFonts.ubuntu(
    fontSize: 20,
    color: Colors.white,
  );
}
