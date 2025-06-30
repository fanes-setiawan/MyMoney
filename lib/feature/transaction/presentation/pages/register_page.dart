import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/config/theme.dart';
import 'package:my_money/feature/transaction/presentation/bloc/bloc_register/register_bloc.dart';
import 'package:my_money/feature/transaction/presentation/widgets/button_field_widget.dart';
import 'package:my_money/feature/transaction/presentation/widgets/text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Success Register!!!')));
          Navigator.pop(context);
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.border,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: AppColors.primary,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Sign-Up",
            style: TextStyle(fontSize: 24.0, color: AppColors.primary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign-Up",
                style: TextStyle(
                  fontSize: 36.0,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Login up to join with uts!",
                style: TextStyle(fontSize: 16.0, color: AppColors.primary),
              ),
              const SizedBox(height: 56.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      hintText: "Full Name",
                      pathIcon: "assets/icons/people.svg",
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'name is required!!';
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hintText: "Email",
                      pathIcon: "assets/icons/email-at.svg",
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email is required!!';
                        }
                        if (!value.contains('@')) {
                          return 'invalid email!!';
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hintText: "Password",
                      pathIcon: "assets/icons/password-str.svg",
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required!!';
                        }
                        if (value.length < 6) {
                          return 'Minimum password 6';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 46.0),
              ButtonFieldWidget(
                text: "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = nameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    context.read<RegisterBloc>().add(
                      RegisterSubmitted(
                        name: name,
                        email: email,
                        password: password,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
