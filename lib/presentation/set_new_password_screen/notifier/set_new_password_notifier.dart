import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:teleportauth/presentation/set_new_password_screen/models/set_new_password_model.dart';
part 'set_new_password_state.dart';

final setNewPasswordNotifier =
    StateNotifierProvider<SetNewPasswordNotifier, SetNewPasswordState>((ref) =>
        SetNewPasswordNotifier(SetNewPasswordState(
            newpasswordController: TextEditingController(),
            confirmpasswordController: TextEditingController(),
            isShowPassword: false,
            isShowPassword1: false,
            setNewPasswordModelObj: SetNewPasswordModel())));

/// A notifier that manages the state of a SetNewPassword according to the event that is dispatched to it.
class SetNewPasswordNotifier extends StateNotifier<SetNewPasswordState> {
  SetNewPasswordNotifier(SetNewPasswordState state) : super(state);

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !(state.isShowPassword ?? false));
  }

  void changePasswordVisibility1() {
    state = state.copyWith(isShowPassword1: !(state.isShowPassword1 ?? false));
  }
}
