import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/user_data_model.dart';
import '../../../../provider/auth_user_provider.dart';
import '../../../../provider/theme_provider.dart';
import '../../../../utilities/app_assets.dart';
import '../../../../utilities/app_color.dart';
import '../../../../utilities/dialog_utils.dart';
import '../../../../utilities/firebase_utils.dart';
import '../../../../utilities/text_form_field_item.dart';
import '../../home_screen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "registerScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeProvider themeProvider;
  late AuthUserProvider authUserProvider;
  TextEditingController nameController = TextEditingController(text: 'moemen');

  TextEditingController emailController =
      TextEditingController(text: 'moemen@gmail.com');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  TextEditingController confirmPasswordController =
      TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

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
              "Create Account",
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
                    TextFormFieldItem(
                      label: 'User Name',
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter User Name';
                        }
                        return null;
                      },
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
                    TextFormFieldItem(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Confirm Password';
                        }
                        if (text != passwordController.text) {
                          return "Confirm Password doesn't  match password .";
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
                            register();
                          },
                          child: Text(
                            "Create Account",
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context: context, message: 'Loading...');
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        UserModel user = UserModel(
            id: credential.user?.uid ?? '',
            email: emailController.text,
            userName: nameController.text);
        authUserProvider.updateUser(user);
        await FirebaseUtils.addUserToFireStore(user);

        DialogUtils.hideLoading(context);

        DialogUtils.showMessage(
            context: context,
            message: 'Register Successfully',
            title: 'success',
            posActionName: "Ok",
            posActionClick: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          DialogUtils.hideLoading(context);

          DialogUtils.showMessage(
              context: context,
              message: 'The password provided is too weak.',
              title: 'Error',
              posActionName: "Ok");
        } else if (e.code == 'email-already-in-use') {
          DialogUtils.hideLoading(context);

          DialogUtils.showMessage(
              context: context,
              posActionName: "Ok",
              message: 'The account already exists for that email.',
              title: 'Error');
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
        if (context.mounted) {
          DialogUtils.showMessage(
              context: context, message: e.toString(), title: 'Error');
          print(e.toString());
        }
      }
    }
  }
}