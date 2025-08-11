import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Esta extensão serve para facilitar o acesso aos estilos das typografias.
/// Organizando em um só local, a tipografia pode ser chamada assim: `Typography().kobe.textStyle`.
extension TypographyExtension on Typography {
  KobeTypography get kobe => KobeTypography();
}

class KobeTypography {
  TextStyle get regular => GoogleFonts.lato(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
    height: 1.0,
  );

  TextStyle get black => GoogleFonts.lato(
    color: Colors.white,
    fontSize: 12.5,
    fontWeight: FontWeight.w900,
    letterSpacing: 0,
    height: 1.0,
  );

  TextStyle get light => GoogleFonts.lato(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    height: 1.0,
  );

  TextStyle get medium => GoogleFonts.lato(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.0,
  );
}