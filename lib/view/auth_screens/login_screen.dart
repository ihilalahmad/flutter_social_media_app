import 'package:flutter/material.dart';
import 'package:tech_media/res/components/input_text_field.dart';
import 'package:tech_media/res/components/round_button.dart';
import 'package:tech_media/utils/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  'Welcome to the App',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  'Enter your email to connect to your account',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: height * .01,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * .06),
                    child: Column(
                      children: [
                        TextInputField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          onFieldSubmittedValue: (value) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter email' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          isObscure: false,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        TextInputField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          onFieldSubmittedValue: (value) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter password' : null;
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'Password',
                          isObscure: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 15, decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                RoundButton(
                  btnText: 'Login',
                  // btnColor: Colors.red,
                  btnTextColor: Colors.black,
                  onBtnClick: () {
                    print('btn clicked');
                  },
                  isLoading: false,
                ),
                SizedBox(
                  height: height * .03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouteName.registerScreen);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Don\'t have account? ',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 15,
                          ),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
