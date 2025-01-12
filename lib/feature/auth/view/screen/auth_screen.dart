import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/auth/cubit/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/validator.dart';
import '../../cubit/cubit/auth_cubit.dart';
import '../widget/custom_textField.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController profileImageController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  bool visible = true;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSucessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text(state.userdata["message"])),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 24.0,
                      bottom: 24.0,
                      right: 24.0,
                    ),
                    child: Column(
                      children: [
                        Text("Register"),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Fill your information below",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: nameController,
                    validator: (value) {
                      MyValidators.displayNameValidator(value);
                    },
                    label: "Name",
                    hint: "Enter your name",
                    prefix: Icons.account_circle,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: nationalIdController,
                    validator: (value) {
                      MyValidators.nationalIdValidator(value);
                    },
                    keyboard: TextInputType.number,
                    label: "National ID",
                    hint: "Enter your ID",
                    prefix: Icons.perm_identity_outlined,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      MyValidators.phoneValidator(value);
                    },
                    keyboard: TextInputType.emailAddress,
                    label: "Email",
                    hint: "example@gmail.com",
                    prefix: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: phoneController,
                    validator: (value) {
                      MyValidators.phoneValidator(value);
                    },
                    keyboard: TextInputType.phone,
                    label: "Phone Number",
                    hint: "Enter your phone",
                    prefix: Icons.phone,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: genderController,
                    validator: (value) {
                      MyValidators.emailValidator(value);
                    },
                    keyboard: TextInputType.emailAddress,
                    label: "Gender",
                    hint: "Enter Gender",
                    prefix: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      MyValidators.passwordValidator(value);
                    },
                    keyboard: TextInputType.visiblePassword,
                    obscureText: visible,
                    label: "Password",
                    hint: "Enter a password",
                    prefix: Icons.lock,
                    suffix: IconButton(
                        onPressed: () {
                          visible = !visible;
                          setState(() {});
                        },
                        icon: visible == false
                            ? const Icon(
                                Icons.remove_red_eye,
                              )
                            : const Icon(
                                Icons.visibility_off,
                              )),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: tokenController,
                    validator: (value) {
                      MyValidators.tokenValidator(value);
                    },
                    label: "Token",
                    hint: "Enter a token",
                    prefix: Icons.token,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (state is AuthSucessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(state.userdata["message"])),
                        );
                      }
                      AuthCubit().postDataCubit(
                        namedata: nameController.text,
                        emaildata: emailController.text,
                        genderdata: genderController.text,
                        nationalIddata: nationalIdController.text,
                        passworddata: passwordController.text,
                        phonedata: phoneController.text,
                        profileImagedata: profileImageController.text,
                        tokendata: tokenController.text,
                      );
                    },
                    child: const Text("SinUp"),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
