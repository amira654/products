import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/validator.dart';
import '../../../home/view/screen/start_screen.dart';
import '../../cubit/cubit/auth_cubit.dart';
import '../../cubit/cubit/auth_state.dart';
import '../widget/listener_widget.dart';
import 'auth_screen.dart';
import '../widget/custom_textField.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: listener,
        builder: (context, state) {
          return Material(
            child: InkWell(
              onTap: (){
                FocusScope.of(context).unfocus(); 
              },
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(top: 150, left: 20, right: 15),
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20.0,
                            left: 24.0,
                            bottom: 24.0,
                            right: 24.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Login",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Hi! Welcome back,you'v been missed",
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
                        CustomTextField(
                          validator: (value) {
                            return MyValidators.emailValidator(value);
                          },
                          keyboard: TextInputType.emailAddress,
                          label: "Email",
                          hint: "example@gmail.com",
                          prefix: Icons.email,
                          controller: emailController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: passwordController,
                          validator: (value) {
                            return MyValidators.passwordValidator(value);
                          },
                          keyboard: TextInputType.visiblePassword,
                          label: "Password",
                          hint: "Enter a password",
                          prefix: Icons.lock,
                          obscureText: visible,
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
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().postLoginCubit(
                                emaildata: emailController.text,
                                passworddata: passwordController.text);
                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StartScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text("Login"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign Up",
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
              ),
            ),
          );
        },
      ),
    );
  }
}
