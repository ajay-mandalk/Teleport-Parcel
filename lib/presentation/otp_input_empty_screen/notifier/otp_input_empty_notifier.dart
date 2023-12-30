import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:teleportauth/presentation/otp_input_empty_screen/models/otp_input_empty_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'otp_input_empty_state.dart';

final otpInputEmptyNotifier =
    StateNotifierProvider<OtpInputEmptyNotifier, OtpInputEmptyState>((ref) =>
        OtpInputEmptyNotifier(OtpInputEmptyState(
            otpController: TextEditingController(),
            otpInputEmptyModelObj: OtpInputEmptyModel())));

/// A notifier that manages the state of a OtpInputEmpty according to the event that is dispatched to it.
class OtpInputEmptyNotifier extends StateNotifier<OtpInputEmptyState>
    with CodeAutoFill {
  OtpInputEmptyNotifier(OtpInputEmptyState state) : super(state);

  @override
  void codeUpdated() {
    state.otpController?.text = code ?? '';
  }
}
