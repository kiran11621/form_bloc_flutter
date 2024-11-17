import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:form_bloc/form_events.dart';
import 'package:form_bloc/form_state.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => FormBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BLoC Form"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: BlocListener<FormBloc, LoginFormState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Form submitted successfully!')),
                  );
                } else if (state.isFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form submission failed!')),
                  );
                }
              },
              child: BlocBuilder<FormBloc, LoginFormState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      TextField(
                        onChanged: (value) =>
                            context.read<FormBloc>().add(EmailChanged(value)),
                        decoration: InputDecoration(
                          labelText: "Email",
                          errorText:
                              state.isValidEmail ? null : 'Invalid  Email',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: (value) => context
                            .read<FormBloc>()
                            .add(PasswordChanged(value)),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: state.isValidPassword
                              ? null
                              : 'Password must be at least 6 characters',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      state.isSubmitting
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () =>
                                  context.read<FormBloc>().add(FormSubmitted()),
                              child: const Text('Submit'),
                            ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
