// ignore_for_file: must_be_immutable

part of 'login_page_notifier.dart';

/// Represents the state of LoginPage in the application.
class LoginPageState extends Equatable {
  LoginPageState({
    this.passwordController,
    this.isShowPassword = true,
    this.loginPageModelObj,
  });

  TextEditingController? passwordController;

  LoginPageModel? loginPageModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        passwordController,
        isShowPassword,
        loginPageModelObj,
      ];

  LoginPageState copyWith({
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginPageModel? loginPageModelObj,
  }) {
    return LoginPageState(
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginPageModelObj: loginPageModelObj ?? this.loginPageModelObj,
    );
  }
}
