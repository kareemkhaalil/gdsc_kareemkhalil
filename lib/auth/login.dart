import 'package:flutter/material.dart';
import 'package:gdsc_kareemkhalil/animatedList.dart';
import 'package:gdsc_kareemkhalil/auth/login.dart';
import 'package:gdsc_kareemkhalil/auth/signUp.dart';
import 'package:gdsc_kareemkhalil/component/cliper.dart';
import 'package:gdsc_kareemkhalil/component/color.dart';
import 'package:gdsc_kareemkhalil/component/customButtonAuth.dart';
import 'package:gdsc_kareemkhalil/component/customTextFormAuth.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: size.height / 3,
                  width: size.width,
                  color: AppColors.lightBlue,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),

              /// Email Text Form
              CustomTextFormFeild(
                obscureText: false,
                validator: (val) {
                  if (val!.isNotEmpty) {
                    if (!val.contains('@')) {
                      return 'Not Valid Email';
                    }
                  }
                  if (val.isEmpty) {
                    return 'Enter Your Email';
                  }
                  return null;
                },
                suffixIcon: Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',
                controller: emailController,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),

              /// Password Text Form
              CustomTextFormFeild(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Your Password';
                  }
                  return null;
                },

                obscureText: obscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color:
                        obscureText == true ? Colors.grey : AppColors.lightBlue,
                  ),
                ),
                prefixIcon: Icon(Icons.lock_outline),

                // onTap: () {
                //   controller.isPasswordVisible.value =
                //       !controller.isPasswordVisible.value;
                // },

                keyboardType: TextInputType.visiblePassword,
                labelText: 'Password',
                controller: passwordController,
              ),

              SizedBox(
                height: size.height * 0.05,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBlue,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.32,
                    vertical: size.height * 0.018,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint('Valid');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AnimatedListScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Login'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.3,
                    vertical: size.height * 0.018,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                child: Text(
                  'Sign Up'.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.lightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
