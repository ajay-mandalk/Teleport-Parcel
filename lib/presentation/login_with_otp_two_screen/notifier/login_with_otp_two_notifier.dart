import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:teleportauth/presentation/login_with_otp_two_screen/models/login_with_otp_two_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'login_with_otp_two_state.dart';

final loginWithOtpTwoNotifier =
    StateNotifierProvider<LoginWithOtpTwoNotifier, LoginWithOtpTwoState>(
        (ref) => LoginWithOtpTwoNotifier(LoginWithOtpTwoState(
            otpController: TextEditingController(),
            loginWithOtpTwoModelObj: LoginWithOtpTwoModel())));

/// A notifier that manages the state of a LoginWithOtpTwo according to the event that is dispatched to it.
class LoginWithOtpTwoNotifier extends StateNotifier<LoginWithOtpTwoState>
    with CodeAutoFill {
  LoginWithOtpTwoNotifier(LoginWithOtpTwoState state) : super(state);

  @override
  void codeUpdated() {
    state.otpController?.text = code ?? '';
  }
}
