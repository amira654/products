import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/validator.dart';
import '../widget/listener_widget.dart';
import '../widget/select_gender.dart';
import 'login_screen.dart';
import '../../cubit/cubit/auth_cubit.dart';
import '../../cubit/cubit/auth_state.dart';
import '../widget/custom_textField.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController profileImageController = TextEditingController();
  bool visible = true;
  String? selectedGender;
  List<String> genderList = ['male', 'female'];

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nationalIdController.dispose();
    genderController.dispose();
    passwordController.dispose();
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: listener,
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
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
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    context.read<AuthCubit>().image == null
                        ? MaterialButton(
                            onPressed: () {
                              context.read<AuthCubit>().addImage();
                            },
                            child: const Icon(
                              Icons.camera,
                              size: 80,
                            ),
                          )
                        : Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    FileImage(context.read<AuthCubit>().image!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: nameController,
                      validator: (value) {
                        return MyValidators.displayNameValidator(value);
                      },
                      label: "Name",
                      hint: "Enter your name",
                      prefix: Icons.account_circle,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: nationalIdController,
                      validator: (value) {
                        return MyValidators.nationalIdValidator(value);
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
                        return MyValidators.emailValidator(value);
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
                        return MyValidators.phoneValidator(value);
                      },
                      keyboard: TextInputType.phone,
                      label: "Phone Number",
                      hint: "Enter your phone",
                      prefix: Icons.phone,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: passwordController,
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                      obscureText: visible,
                      keyboard: TextInputType.visiblePassword,
                      label: "Password",
                      hint: "Enter a password",
                      prefix: Icons.lock,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: Icon(
                          visible ? Icons.visibility_off : Icons.remove_red_eye,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: tokenController,
                      validator: (value) {
                        return MyValidators.tokenValidator(value);
                      },
                      label: "Token",
                      hint: "Enter a token",
                      prefix: Icons.token,
                    ),
                    const SizedBox(height: 20),
                    GenderSelection(
                      genderController: genderController,
                    ),
                    const SizedBox(height: 20),
                    state is AuthLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const SizedBox(
                            width: 20,
                            height: 10,
                          ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().postDataCubit(
                              namedata: nameController.text,
                              emaildata: emailController.text,
                              phonedata: phoneController.text,
                              nationalIddata: nationalIdController.text,
                              genderdata: genderController.text,
                              passworddata: passwordController.text,
                              tokendata: tokenController.text,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Register",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xff6759FF),
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff6759FF),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}