import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/form_events.dart';
import 'package:form_bloc/form_state.dart';

class FormBloc extends Bloc<FormEvent, LoginFormState> {
  FormBloc() : super(LoginFormState.initial()) {
    on<EmailChanged>(
      (event, emit) {
        final isValidEmail = _validateEmail(event.email);
        emit(state.copyWith(email: event.email, isValidEmail: isValidEmail));
      },
    );

    on<PasswordChanged>((event, emit) {
      final isValidPassword = _validatePassword(event.password);
      emit(state.copyWith(
          password: event.password, isValidPassword: isValidPassword));
    });

    on<FormSubmitted>((event, emit) async {
      if (state.isValidEmail && state.isValidPassword) {
        emit(state.copyWith(isSubmitting: true));
        await Future.delayed(const Duration(seconds: 2));
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        emit(state.copyWith(isFailure: true));
      }
    });
  }

  bool _validateEmail(String email) {
    return email.contains('@') && email.isNotEmpty;
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }
}
