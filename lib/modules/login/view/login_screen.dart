import 'package:vinnovate_labz/modules/common_global.dart';

import '../../../export.dart';
import 'login_mobile.dart';


class login_screen extends StatelessWidget {
  login_screen({Key? key}) : super(key: key);

  body() {
    return login_mobile();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () async{
          // await web_view_controller_dat.init();
          Future.delayed(const Duration(milliseconds: 600), () {
            login_controller_dat.init();
          });
        },
        child: body());
  }
}