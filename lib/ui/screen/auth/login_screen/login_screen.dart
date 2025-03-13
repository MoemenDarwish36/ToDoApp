import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/auth_user_provider.dart';
import '../../../../provider/theme_provider.dart';
import '../../../../utilities/app_assets.dart';
import '../../../../utilities/app_color.dart';
import '../../../../utilities/dialog_utils.dart';
import '../../../../utilities/firebase_utils.dart';
import '../../../../utilities/text_form_field_item.dart';
import '../../home_screen/home_screen.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeProvider themeProvider;
  late AuthUserProvider authUserProvider;
  TextEditingController emailController =
      TextEditingController(text: 'moemen@gmail.com');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    authUserProvider = Provider.of(context);
    return Stack(
      children: [
        Container(
          color: themeProvider.isDarkThemeEnabled
              ? AppColors.backGroundDarkColor
              : AppColors.backGroundLightColor,
          child: Image.asset(
            AppAssets.background,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Login",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome Back!",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    TextFormFieldItem(
                      label: "Email",
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Email';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormFieldItem(
                      label: 'Password',
                      controller: passwordController,
                      obscureText: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Password';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 character';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            login();
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text(
                          'Or Create Account',
                          style: Theme.of(context).textTheme.labelSmall,
                        ))
                  ],
                ),
              )),
        )
      ],
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context: context, message: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        var user = await FirebaseUtils.readUserFromFireStore(
            credential.user?.uid ?? '');
        if (user == null) {
          return;
        }
        authUserProvider.updateUser(user);

        DialogUtils.hideLoading(context);

        DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            title: 'success',
            posActionName: "Ok",
            posActionClick: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          DialogUtils.hideLoading(context);

          DialogUtils.showMessage(
              context: context,
              message:
                  'The supplied auth credential is incorrect, malformed or has expired5.',
              title: 'Error',
              posActionName: "Ok");
        } else if (e.code == 'network-request-failed') {
          DialogUtils.hideLoading(context);

          DialogUtils.showMessage(
              context: context,
              posActionName: "Ok",
              message:
                  'A network error (such as timeout, interrupted connection or unreachable host) has occurred.',
              title: 'Error');
        }
      } catch (e) {
        DialogUtils.hideLoading(context);

        DialogUtils.showMessage(
            context: context,
            message: e.toString(),
            title: 'Error',
            posActionName: "Ok");
      }
    }
  }
}
