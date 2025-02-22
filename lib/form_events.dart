import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();
}

class EmailChanged extends FormEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends FormEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends FormEvent {
  @override
  List<Object> get props => [];
}
