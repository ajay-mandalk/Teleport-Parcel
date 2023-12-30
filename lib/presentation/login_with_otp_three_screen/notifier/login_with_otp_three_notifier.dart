import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:teleportauth/presentation/login_with_otp_three_screen/models/login_with_otp_three_model.dart';
part 'login_with_otp_three_state.dart';

final loginWithOtpThreeNotifier =
    StateNotifierProvider<LoginWithOtpThreeNotifier, LoginWithOtpThreeState>(
  (ref) => LoginWithOtpThreeNotifier(LoginWithOtpThreeState(
    loginWithOtpThreeModelObj: LoginWithOtpThreeModel(),
  )),
);

/// A notifier that manages the state of a LoginWithOtpThree according to the event that is dispatched to it.
class LoginWithOtpThreeNotifier extends StateNotifier<LoginWithOtpThreeState> {
  LoginWithOtpThreeNotifier(LoginWithOtpThreeState state) : super(state) {}
}
