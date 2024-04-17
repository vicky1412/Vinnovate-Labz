
import '../../../export.dart';
import '../../common_global.dart';
import 'login_widgets.dart';

class login_mobile extends StatelessWidget {
  const login_mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          physics: scroll_physics,
          child: Obx(() =>
          login_controller_dat.refresh_loader.value
                  ? 1.widthBox
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        login_main_widget()
                      ],
                    )),
        ),
      ),
    ));
  }
}
