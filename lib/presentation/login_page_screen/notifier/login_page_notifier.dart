import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:teleportauth/presentation/login_page_screen/models/login_page_model.dart';
part 'login_page_state.dart';

final loginPageNotifier =
    StateNotifierProvider<LoginPageNotifier, LoginPageState>((ref) =>
        LoginPageNotifier(LoginPageState(
            passwordController: TextEditingController(),
            isShowPassword: false,
            loginPageModelObj: LoginPageModel())));

/// A notifier that manages the state of a LoginPage according to the event that is dispatched to it.
class LoginPageNotifier extends StateNotifier<LoginPageState> {
  LoginPageNotifier(LoginPageState state) : super(state);

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !(state.isShowPassword ?? false));
  }
}
