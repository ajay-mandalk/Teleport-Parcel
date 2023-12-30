import 'notifier/login_with_otp_three_notifier.dart';
import 'package:flutter/material.dart';
import 'package:teleportauth/core/app_export.dart';

class LoginWithOtpThreeScreen extends ConsumerStatefulWidget {
  const LoginWithOtpThreeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginWithOtpThreeScreenState createState() => LoginWithOtpThreeScreenState();
}

class LoginWithOtpThreeScreenState
    extends ConsumerState<LoginWithOtpThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 49.h,
            top: 205.v,
            right: 49.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage2,
                height: 117.adaptSize,
                width: 117.adaptSize,
                radius: BorderRadius.circular(
                  58.h,
                ),
              ),
              SizedBox(height: 3.v),
              Text(
                "msg_phone_number_verified".tr,
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 12.v),
              SizedBox(
                width: 273.h,
                child: Text(
                  "msg_you_will_be_redirected".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style:
                      CustomTextStyles.bodyMediumMuseoSans500Black900.copyWith(
                    height: 1.71,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
