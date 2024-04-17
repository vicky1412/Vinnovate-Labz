import 'package:vinnovate_labz/modules/common_global.dart';

import '../../../export.dart';

import 'courses_mobile.dart';

class courses_screen extends StatelessWidget {
  courses_screen({Key? key}) : super(key: key);

  body() {
    return courses_mobile();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () async{
          await courses_controller_dat.init();
        },
        child: body());
  }
}