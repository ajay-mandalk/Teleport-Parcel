// ignore_for_file: must_be_immutable

part of 'set_new_password_notifier.dart';

/// Represents the state of SetNewPassword in the application.
class SetNewPasswordState extends Equatable {
  SetNewPasswordState({
    this.newpasswordController,
    this.confirmpasswordController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.setNewPasswordModelObj,
  });

  TextEditingController? newpasswordController;

  TextEditingController? confirmpasswordController;

  SetNewPasswordModel? setNewPasswordModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        newpasswordController,
        confirmpasswordController,
        isShowPassword,
        isShowPassword1,
        setNewPasswordModelObj,
      ];

  SetNewPasswordState copyWith({
    TextEditingController? newpasswordController,
    TextEditingController? confirmpasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    SetNewPasswordModel? setNewPasswordModelObj,
  }) {
    return SetNewPasswordState(
      newpasswordController:
          newpasswordController ?? this.newpasswordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      setNewPasswordModelObj:
          setNewPasswordModelObj ?? this.setNewPasswordModelObj,
    );
  }
}
