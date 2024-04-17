import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinnovate_labz/modules/courses/view/courses_screen.dart';
import 'package:vinnovate_labz/modules/login/view/login_screen.dart';

import '../../../export.dart';

class login_controller extends GetxController {
  TextEditingController login_email_controller = TextEditingController();
  TextEditingController login_password_controller = TextEditingController();
  var refresh_loader = false.obs;
  var login_password_visibility_controller = false.obs;
  var login_form_autovalidate_controller = false.obs;
  final formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();



  init()async{}


  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      print('User signed in: ${user!.uid}');
      navigate();
    } catch (e) {
      print('Sign-in failed: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
          content: Text('Sign-in failed'),
    duration: Duration(seconds: 2)));
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.off(()=> login_screen());
  }

  validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      signInWithEmailPassword(login_email_controller.text.trim(), login_password_controller.text.trim());
      print('Email: $login_email_controller, Password: $login_password_controller');
    }else{
      login_form_autovalidate_controller.value = true;
    }
  }

  navigate() {
    Get.to(()=> courses_screen(), transition: page_transition, duration: page_transition_duration);
  }
}
