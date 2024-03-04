// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reefs_nav/core/constant/color.dart';
import 'package:reefs_nav/core/constant/routes.dart';
import 'package:reefs_nav/core/services/auth_service.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../widget/auth/customebuttonauth.dart';
import '../../widget/auth/custometextformauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controllerImp = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundsecond,
        elevation: 0.0,
        centerTitle: true,
        title: Text("11".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.white)),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
              const SizedBox(height: 100),
              CustomeTextFormAuth(
                //UserName field
                hinttext: "16".tr, //enter UserName
                labeltext: "15".tr, //User name
                iconData: Icons.person_outline,
                mycontroller: controllerImp.username,
              ),
              CustomeTextFormAuth(
                  //Email field
                  hinttext: "18".tr,
                  labeltext: "17".tr,
                  iconData: Icons.email_outlined,
                  mycontroller: controllerImp.email),
              CustomeTextFormAuth(
                //password field
                hinttext: "7".tr, //enter pass
                labeltext: "5".tr, //pass
                iconData: Icons.password_outlined,
                mycontroller: controllerImp.password,
              ),
              CustomeTextFormAuth(
                //password confirmation field
                hinttext: "13".tr, //enter pass
                labeltext: "14".tr, //pass
                iconData: Icons.password_outlined,
                mycontroller: controllerImp.confirmpass,
              ),
              CustomeButtonAuth(
                  //signUp button
                  text: '11'.tr,
                  onPressed: () async {
                    final signUp = await AuthService().signUp(
                        controllerImp.email.text,
                        controllerImp.password.text,
                        controllerImp.username.text);
                    if (signUp != null) {
                      Get.toNamed(AppRoute.login);
                    } else {
                      const snackBar = SnackBar(content: Text("Error"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              TextSignUpIn(
                textone: "12".tr, //have account field
                texttwo: "9".tr, //SignIn
                onTap: () {
                  controllerImp.goToLogin();
                },
              )
            ],
          )),
    );
  }
}
