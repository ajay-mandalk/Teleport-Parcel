import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:teleportauth/presentation/forgot_password_screen/models/forgot_password_model.dart';
part 'forgot_password_state.dart';

final forgotPasswordNotifier =
    StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((ref) =>
        ForgotPasswordNotifier(ForgotPasswordState(
            inputFieldController: TextEditingController(),
            forgotPasswordModelObj: ForgotPasswordModel())));

/// A notifier that manages the state of a ForgotPassword according to the event that is dispatched to it.
class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordNotifier(ForgotPasswordState state) : super(state);
}
