import 'notifier/set_new_password_notifier.dart';
import 'package:flutter/material.dart';
import 'package:teleportauth/core/app_export.dart';
import 'package:teleportauth/core/utils/validation_functions.dart';
import 'package:teleportauth/widgets/custom_outlined_button.dart';
import 'package:teleportauth/widgets/custom_text_form_field.dart';

class SetNewPasswordScreen extends ConsumerStatefulWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  SetNewPasswordScreenState createState() => SetNewPasswordScreenState();
}

// ignore_for_file: must_be_immutable
class SetNewPasswordScreenState extends ConsumerState<SetNewPasswordScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 59.v),
                    child: Column(children: [
                      Text("msg_set_new_password".tr,
                          style: theme.textTheme.headlineSmall),
                      SizedBox(height: 84.v),
                      _buildSetNewPassword(context),
                      SizedBox(height: 19.v),
                      _buildPasswordInputField(context),
                      SizedBox(height: 32.v),
                      CustomOutlinedButton(text: "lbl_reset_password".tr),
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
                              textAlign: TextAlign.left)),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildSetNewPassword(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_new_password".tr, style: theme.textTheme.titleMedium),
      SizedBox(height: 14.v),
      Consumer(builder: (context, ref, _) {
        return CustomTextFormField(
            controller: ref.watch(setNewPasswordNotifier).newpasswordController,
            hintText: "msg_enter_new_password".tr,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
                onTap: () {
                  ref
                      .read(setNewPasswordNotifier.notifier)
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
            obscureText: ref.watch(setNewPasswordNotifier).isShowPassword);
      })
    ]);
  }

  /// Section Widget
  Widget _buildPasswordInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_confirm_password".tr, style: theme.textTheme.titleMedium),
      SizedBox(height: 14.v),
      Consumer(builder: (context, ref, _) {
        return CustomTextFormField(
            controller:
                ref.watch(setNewPasswordNotifier).confirmpasswordController,
            hintText: "msg_confirm_password2".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
                onTap: () {
                  ref
                      .read(setNewPasswordNotifier.notifier)
                      .changePasswordVisibility1();
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
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
            obscureText: ref.watch(setNewPasswordNotifier).isShowPassword1);
      })
    ]);
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtRememberedpassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
