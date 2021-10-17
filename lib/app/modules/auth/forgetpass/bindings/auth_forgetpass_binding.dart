import 'package:get/get.dart';

import '../controllers/auth_forgetpass_controller.dart';

class AuthForgetpassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthForgetpassController>(
      () => AuthForgetpassController(),
    );
  }
}
