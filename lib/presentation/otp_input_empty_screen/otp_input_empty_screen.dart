import 'notifier/otp_input_empty_notifier.dart';
import 'package:flutter/material.dart';
import 'package:teleportauth/core/app_export.dart';
import 'package:teleportauth/widgets/custom_outlined_button.dart';
import 'package:teleportauth/widgets/custom_pin_code_text_field.dart';

class OtpInputEmptyScreen extends ConsumerStatefulWidget {
  const OtpInputEmptyScreen({Key? key}) : super(key: key);

  @override
  OtpInputEmptyScreenState createState() => OtpInputEmptyScreenState();
}

class OtpInputEmptyScreenState extends ConsumerState<OtpInputEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 139.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: _buildOtpInputEmpty(context)))
                ]))));
  }

  /// Section Widget
  Widget _buildOtpInputEmpty(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 17.h, right: 17.h, bottom: 238.v),
        child: Column(children: [
          Text("lbl_enter_otp".tr, style: theme.textTheme.headlineSmall),
          SizedBox(height: 10.v),
          Container(
              width: 254.h,
              margin: EdgeInsets.only(left: 42.h, right: 43.h),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "msg_we_ve_sent_an_otp2".tr,
                        style: theme.textTheme.bodyMedium),
                    TextSpan(
                        text: "msg_random3321_gmail_com".tr,
                        style: CustomTextStyles.bodyMediumOnPrimary)
                  ]),
                  textAlign: TextAlign.center)),


          SizedBox(height: 54.v),
          Consumer(builder: (context, ref, _) {
            return CustomPinCodeTextField(
                context: context,
                controller: ref.watch(otpInputEmptyNotifier).otpController,
                onChanged: (value) {
                  ref.watch(otpInputEmptyNotifier).otpController?.text = value;
                });

                
          }),
          SizedBox(height: 58.v),
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "msg_didn_t_receive_any2".tr,
                    style: CustomTextStyles.bodyMediumBluegray400),
                TextSpan(text: " "),
                TextSpan(
                    text: "lbl_resend".tr,
                    style: CustomTextStyles.titleSmallSecondaryContainer)
              ]),
              textAlign: TextAlign.left),
          SizedBox(height: 32.v),
          CustomOutlinedButton(text: "lbl_verify".tr),
          SizedBox(height: 34.v),
          GestureDetector(
              onTap: () {
                onTapTxtRememberedpassword(context);
              },
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "msg_remembered_password2".tr,
                        style: theme.textTheme.bodyMedium),
                    TextSpan(text: " "),
                    TextSpan(
                        text: "lbl_sign_in".tr,
                        style: CustomTextStyles.titleSmallOnPrimary)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtRememberedpassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
