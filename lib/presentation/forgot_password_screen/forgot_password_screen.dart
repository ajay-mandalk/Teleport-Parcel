import 'notifier/forgot_password_notifier.dart';
import 'package:flutter/material.dart';
import 'package:teleportauth/core/app_export.dart';
import 'package:teleportauth/widgets/custom_outlined_button.dart';
import 'package:teleportauth/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 153.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: _buildForgotPasswordSection(context)))
                ]))));
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
  Widget _buildForgotPasswordSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 238.v),
        child: Column(children: [
          Text("msg_forgot_password2".tr, style: theme.textTheme.headlineSmall),
          SizedBox(height: 8.v),
          Container(
              width: 244.h,
              margin: EdgeInsets.symmetric(horizontal: 45.h),
              child: Text("msg_enter_your_email".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(height: 1.40))),
          SizedBox(height: 56.v),
          _buildThreeSection(context),
          SizedBox(height: 32.v),
          CustomOutlinedButton(
              text: "lbl_continue".tr,
              buttonTextStyle: CustomTextStyles.titleMediumBlack900,
              onPressed: () {
                onTapContinue(context);
              }),
          SizedBox(height: 34.v),
          GestureDetector(
              onTap: () {
                onTapTxtRememberedpassword(context);
              },
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "msg_remembered_password2".tr,
                        style: CustomTextStyles.bodyMediumBluegray400),
                    TextSpan(text: " "),
                    TextSpan(
                        text: "lbl_sign_in".tr,
                        style: CustomTextStyles.titleSmallMedium)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }

  /// Navigates to the otpInputEmptyScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.otpInputEmptyScreen,
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtRememberedpassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
