import 'package:flutter/material.dart';

import 'global.dart';

Color bg_grey_color = Colors.grey.withOpacity(0.08);
Color text_color = const Color(0xff222222);
Color border_idle_color = const Color(0xff7C7D7D);
var fade_bg_color = Colors.grey.withOpacity(0.1);
var txt_field_focus_color = Colors.blue;
Color primary_color = const Color(4288190976);
Color b2b_primary_color = const Color(0xffB2BB1D);
Color secondary_color = const Color(4293847552);

var scroll_theme = ScrollbarThemeData(
  thumbColor: MaterialStateProperty.resolveWith((states) {
    // Return the color based on the current state
    return primary_color; // Set thumb color to red
  }),
);
var scroll_theme_transparant = ScrollbarThemeData(
  thumbColor: MaterialStateProperty.resolveWith((states) {
    // Return the color based on the current state
    return Colors.transparent; // Set thumb color to red
  }),
);





// "4288190976","secondary":"4293847552"
