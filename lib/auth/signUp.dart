import 'package:flutter/material.dart';
import 'package:gdsc_kareemkhalil/animatedList.dart';
import 'package:gdsc_kareemkhalil/auth/login.dart';
import 'package:gdsc_kareemkhalil/component/cliper.dart';
import 'package:gdsc_kareemkhalil/component/color.dart';
import 'package:gdsc_kareemkhalil/component/customButtonAuth.dart';
import 'package:gdsc_kareemkhalil/component/customTextFormAuth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  bool obscureText = true;

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
                      'Sign Up',
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
                height: size.height * 0.05,
              ),

              /// Name Text Form
              CustomTextFormFeild(
                width: size.width * 0.8,
                obscureText: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Your Name';
                  }
                  return null;
                },
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  size: 20,
                ),
                keyboardType: TextInputType.name,
                labelText: 'User Name',
                controller: nameController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
                prefixIcon: Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',
                controller: emailController,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              /// Phone Text Form
              CustomTextFormFeild(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Your Phone Number';
                  }

                  return null;
                },
                prefixIcon: Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
                labelText: 'phone',
                controller: phoneController,
                obscureText: false,
              ),

              SizedBox(
                height: size.height * 0.02,
              ),

              /// Password Text Form
              CustomTextFormFeild(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Your Password';
                  }
                  return null;
                },
                prefixIcon:
                    // : controller.isPasswordVisible.value
                    // ?
                    Icon(Icons.lock_outline),
                // : Icon(
                //     Icons.lock_open_outlined,
                //     color: Colors.green.withOpacity(0.5),
                //   ),
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
                // onTap: () {
                //   controller.isPasswordVisible.value =
                //       !controller.isPasswordVisible.value;
                // },
                // keyboardType: TextInputType.visiblePassword,
                labelText: 'Password',
                controller: passwordController,
              ),

              SizedBox(
                height: size.height * 0.02,
              ),

              /// Confirm Password Text Form
              CustomTextFormFeild(
                validator: (val) {
                  if (val != passwordController.text) {
                    return 'Password Not Match';
                  }
                  if (val!.isEmpty) {
                    return 'Enter Your Password';
                  }
                  return null;
                },
                prefixIcon:
                    // : controller.isPasswordVisible.value
                    // ?
                    Icon(Icons.lock_outline),
                // : Icon(
                //     Icons.lock_open_outlined,
                //     color: Colors.green.withOpacity(0.5),
                //   ),
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
                keyboardType: TextInputType.visiblePassword,
                labelText: 'Confirm Password',
                controller: confirmPasswordController,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBlue,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.3,
                    vertical: size.height * 0.018,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint('Validated');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimatedListScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Sign Up',
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
                    horizontal: size.width * 0.32,
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
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text(
                  'Login',
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
