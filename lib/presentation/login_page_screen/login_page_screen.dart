import 'package:teleportauth/presentation/forgot_password_screen/notifier/forgot_password_notifier.dart';


import 'notifier/login_page_notifier.dart'; // Import your notifiers
import 'package:flutter/material.dart';
import 'package:teleportauth/core/app_export.dart';
import 'package:teleportauth/core/utils/validation_functions.dart';
import 'package:teleportauth/widgets/custom_outlined_button.dart';
import 'package:teleportauth/widgets/custom_text_form_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPageScreen extends ConsumerStatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  LoginPageScreenState createState() => LoginPageScreenState();
}

// ignore_for_file: must_be_immutable
class LoginPageScreenState extends ConsumerState<LoginPageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController(); 
  bool isDisposed = false;

  @override
  void dispose() {
    // Dispose of the controller only if it has not been disposed before
    if (!isDisposed) {
      phoneNumberController.dispose();
      isDisposed = true;
    }
    super.dispose();
  }
  // Add this line

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 61.v),
            child: Column(
              children: [
                Text("lbl_login".tr, style: theme.textTheme.headlineSmall),
                SizedBox(height: 62.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildThreeSection(context),
                        SizedBox(height: 22.v),
                        _buildPasswordInputField(context),
                        SizedBox(height: 18.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              onTapTxtForgotPassword(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text(
                                "msg_forgot_password".tr,
                                style: CustomTextStyles.bodyMediumOnPrimary_1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                CustomOutlinedButton(
                  text: "lbl_sign_in".tr,
                  onPressed: () {
                    onTapSignIn(context);
                  },
                ),
                SizedBox(height: 59.v),
                _buildSignInDivider(context),
                SizedBox(height: 35.v),
                _buildSocialButtons(context),
                SizedBox(height: 59.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
 

  Widget _buildThreeSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_phone_number".tr, style: theme.textTheme.titleMedium),
      SizedBox(height: 34.v),
      Row(children: [
        CustomOutlinedButton(
            height: 54.v,
            width: 64.h,
            text: "lbl_91".tr,
            buttonStyle: CustomButtonStyles.outlinePrimaryTL8,
            buttonTextStyle:
                CustomTextStyles.titleMediumPlusJakartaSansBluegray100),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: Consumer(builder: (context, ref, _) {
                  final phoneNumberController = TextEditingController(); // Create a new controller
                  ref.watch(forgotPasswordNotifier).inputFieldController = phoneNumberController; // Update the notifier with the new controller
                 
                  return CustomTextFormField(
                      controller: ref
                          .watch(forgotPasswordNotifier)
                          .inputFieldController,
                      textInputAction: TextInputAction.done);
                })))
      ])
    ]);
  }


  /// Section Widget
  Widget _buildPasswordInputField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child:
                  Text("lbl_password".tr, style: theme.textTheme.titleMedium)),
          SizedBox(height: 14.v),
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Consumer(builder: (context, ref, _) {
                return CustomTextFormField(
                    controller: ref.watch(loginPageNotifier).passwordController,
                    hintText: "lbl_enter_password".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          ref
                              .read(loginPageNotifier.notifier)
                              .changePasswordVisibility();
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(12.h, 16.v, 16.h, 16.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgEye,
                                height: 24.adaptSize,
                                width: 24.adaptSize))),
                    suffixConstraints: BoxConstraints(maxHeight: 56.v),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_password".tr;
                      }
                      return null;
                    },
                    obscureText: ref.watch(loginPageNotifier).isShowPassword);
              }))
        ]));
  }

  /// Section Widget
  Widget _buildSignInDivider(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 7.v, bottom: 8.v),
                  child: SizedBox(width: 109.h, child: Divider())),
              Text("lbl_or_sign_in_with".tr,
                  style: CustomTextStyles.bodyMediumBluegray400_1),
              Padding(
                  padding: EdgeInsets.only(top: 7.v, bottom: 8.v),
                  child: SizedBox(width: 113.h, child: Divider()))
            ]));
  }



  /// Section Widget
  Widget _buildSocialButtons(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOutlinedButton(
          width: 160.h,
          height: 54.v,  // Add height argument
          text: "lbl_google".tr,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.h)),
            child: CustomImageView(
              imagePath: ImageConstant.imgGoogle,
              height: 19.v,
              width: 18.h,
            ),
          ),
          buttonStyle: CustomButtonStyles.outlinePrimary,
          buttonTextStyle: theme.textTheme.titleSmall!,
        ),


        CustomOutlinedButton(
          width: 159.h,
          height: 54.v,  // Add height argument
          text: "lbl_apple".tr,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgSocialIconApple,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
          ),
          buttonStyle: CustomButtonStyles.outlinePrimary,
          buttonTextStyle: theme.textTheme.titleSmall!,
        ),
      ],
    ),
  );
}


  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the loginWithOtpTwoScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginWithOtpTwoScreen,
    );
  }
}
