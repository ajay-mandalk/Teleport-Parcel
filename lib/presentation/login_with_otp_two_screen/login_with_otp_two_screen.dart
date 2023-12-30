import 'notifier/login_with_otp_two_notifier.dart';
import 'package:flutter/material.dart';
import 'package:teleportauth/core/app_export.dart';
import 'package:teleportauth/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:teleportauth/widgets/app_bar/appbar_title.dart';
import 'package:teleportauth/widgets/app_bar/custom_app_bar.dart';
import 'package:teleportauth/widgets/custom_pin_code_text_field.dart';

class LoginWithOtpTwoScreen extends ConsumerStatefulWidget {
  const LoginWithOtpTwoScreen({Key? key}) : super(key: key);

  @override
  LoginWithOtpTwoScreenState createState() => LoginWithOtpTwoScreenState();
}

class LoginWithOtpTwoScreenState extends ConsumerState<LoginWithOtpTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 16.h, top: 99.v, right: 16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 327.h,
                          margin: EdgeInsets.only(left: 1.h, right: 14.h),
                          child: Text("msg_enter_6_digit_verification".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleLargeBlack900
                                  .copyWith(height: 1.60))),
                      SizedBox(height: 50.v),
                      Padding(
                          padding: EdgeInsets.only(right: 3.h),
                          child: Consumer(builder: (context, ref, _) {
                            return CustomPinCodeTextField(
                                context: context,
                                controller: ref
                                    .watch(loginWithOtpTwoNotifier)
                                    .otpController,
                                onChanged: (value) {
                                  ref
                                      .watch(loginWithOtpTwoNotifier)
                                      .otpController
                                      ?.text = value;
                                });
                          })),
                      SizedBox(height: 39.v),
                      Padding(
                          padding: EdgeInsets.only(left: 114.h),
                          child: Text("lbl_resend_code".tr,
                              style: CustomTextStyles
                                  .titleSmallPlusJakartaSansBlack900)),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 12.v, bottom: 12.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "msg_phone_verification".tr));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
