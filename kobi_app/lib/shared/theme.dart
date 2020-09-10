part of 'shared.dart';

const double defMargin = 24;

Color mainColor = Color(0xFFFD0808);
Color accent1 = Color(0xFF825613);
Color accent2 = Color(0xFFE1DDDD);
Color accent3 = Color(0xFFB8B1B1);

TextStyle blackText = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteText = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle greyText =
    GoogleFonts.roboto().copyWith(color: accent3, fontWeight: FontWeight.w500);
TextStyle hintText = GoogleFonts.roboto().copyWith(color: accent1);

TextStyle text1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w200);
TextStyle text2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle text3 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold);
