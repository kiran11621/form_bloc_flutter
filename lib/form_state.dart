import 'package:equatable/equatable.dart';

class LoginFormState extends Equatable {
  final String email;
  final String password;
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const LoginFormState({
    required this.email,
    required this.password,
    required this.isValidEmail,
    required this.isValidPassword,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory LoginFormState.initial() {
    return const LoginFormState(
      email: '',
      password: '',
      isValidEmail: true,
      isValidPassword: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? isValidEmail,
    bool? isValidPassword,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        isValidEmail,
        isValidPassword,
        isSubmitting,
        isSuccess,
        isFailure,
      ];
}
