import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/Views/Register_Page/register_view.dart';
import 'package:flutter_login_exercise/util/images.dart';
import 'package:flutter_login_exercise/util/app_colors.dart';
import 'package:flutter_login_exercise/views/Home_Page/home_view.dart';
import 'package:flutter_login_exercise/widgets/textfieldsuffix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  bool loginPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: emailFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  Image.asset(
                    Images.imageLogo,
                    width: 129,
                    height: 129,
                  ),
                  const SizedBox(height: 21),
                  Row(
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: AppColors.appPurple,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(height: 46),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email or username';
                        // loginPassword = true;
                      } else if (value == 'turek') {
                        return null;
                        // loginPassword = false;
                      } else {
                        return 'Email or Username is incorrect';
                        // loginPassword = true;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: Image.asset(Images.userLogo),
                      ),
                      hintText: 'Email or User Name',
                      hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(0, 4),
                                blurRadius: 4.9,
                                color: Color.fromRGBO(0, 0, 0, 0.25))
                          ]),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: AppColors.appBorderPurple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: AppColors.appBorderPurple, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: AppColors.appBorderPurple, width: 2)),
                      errorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextFieldSuffix('Password',
                      suffix: Images.eyeLogo,
                      prefix: Images.padlockLogo,
                      formKey: passwordFormKey),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Spacer(),
                      Text('Forget Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.appPurple,
                          )),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appLightPurple,
                        minimumSize: const Size(390, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      if (emailFormKey.currentState!.validate() &
                          passwordFormKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()),
                        );
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.setBool('isLogged', true);
                      }
                    },
                    child: const Text(
                      'Sing in',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account ?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColors.appPurple,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppColors.appPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
