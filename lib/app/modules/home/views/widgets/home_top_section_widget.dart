import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back,',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'What\'s your outfit today?',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
