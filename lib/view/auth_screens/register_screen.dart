import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/view_model/controllers/auth_controllers/register_controller.dart';

import '../../res/components/input_text_field.dart';
import '../../res/components/round_button.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Consumer<RegisterController>(
          builder: (context, provide, child) {
            return SingleChildScrollView(
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
                    'Enter your email to register your account',
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
                            controller: usernameController,
                            focusNode: usernameFocusNode,
                            onFieldSubmittedValue: (value) {
                              Utils.fieldFocus(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            onValidator: (value) {
                              return value.isEmpty ? 'Enter username' : null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Username',
                            isObscure: false,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
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
                  SizedBox(
                    height: 40,
                  ),
                  RoundButton(
                    btnText: 'Register',
                    // btnColor: Colors.red,
                    btnTextColor: Colors.black,
                    onBtnClick: () {
                      if (_formKey.currentState!.validate()) {
                        provide.registerUser(
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                    isLoading: provide.loading,
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRouteName.loginScreen);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 15,
                            ),
                        children: [
                          TextSpan(
                            text: 'Log In',
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
            );
          },
        ),
      ),
    );
  }
}
