// ignore_for_file: must_be_immutable

part of 'forgot_password_notifier.dart';

/// Represents the state of ForgotPassword in the application.
class ForgotPasswordState extends Equatable {
  ForgotPasswordState({
    this.inputFieldController,
    this.forgotPasswordModelObj,
  });

  TextEditingController? inputFieldController;

  ForgotPasswordModel? forgotPasswordModelObj;

  @override
  List<Object?> get props => [
        inputFieldController,
        forgotPasswordModelObj,
      ];

  ForgotPasswordState copyWith({
    TextEditingController? inputFieldController,
    ForgotPasswordModel? forgotPasswordModelObj,
  }) {
    return ForgotPasswordState(
      inputFieldController: inputFieldController ?? this.inputFieldController,
      forgotPasswordModelObj:
          forgotPasswordModelObj ?? this.forgotPasswordModelObj,
    );
  }
}
