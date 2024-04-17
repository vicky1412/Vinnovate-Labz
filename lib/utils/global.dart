import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:vinnovate_labz/utils/restCallController.dart';

final restCallController_dat = Get.put(RestCallController());



Transition page_transition = Transition.noTransition;

Duration page_transition_duration = const Duration(milliseconds: 20);
double global_scrollSpeed = 2.0;
ScrollPhysics? scroll_physics = null;

ScrollBehavior scroll_behaviour() {
  return ScrollConfiguration.of(Get.context!).copyWith(scrollbars: true);
}
