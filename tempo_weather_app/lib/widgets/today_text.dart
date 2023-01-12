import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';

class TodayText extends StatelessWidget {
  const TodayText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Today',
          style: GoogleFonts.lato(
            fontSize: 22,
            color: AppColors.mylightGrey,
          ),
        ),
      ),
    );
  }
}
