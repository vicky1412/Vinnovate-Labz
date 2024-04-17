import '../../../export.dart';
import 'courses_widgets.dart';

class courses_mobile extends StatelessWidget {
  const courses_mobile({Key? key}) : super(key: key);

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
              courses_controller_dat.refresh_loader.value
                  ? 1.widthBox
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        courses_main_widget(),
                      ],
                    )),
        ),
      ),
    ));
  }
}
