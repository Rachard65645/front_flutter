import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/service_locator.dart';
import '../../business_logic/register_bloc/register_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            context.router.pushAll([const LoginRoute()]);
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(40),
            child: ListView(
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Become new user',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: const InputDecoration(
                              label: Row(
                                children: [Text('Name')],
                              ),
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: const InputDecoration(
                              label: Row(
                                children: [Text('Email')],
                              ),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(_obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            label: const Row(
                              children: [Text('Password')],
                            ),
                            hintText: 'Password',
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          obscureText: _obscureText,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: const InputDecoration(
                              label: Row(
                                children: [Text('Phone')],
                              ),
                              hintText: 'Phone',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: ElevatedButton(
                              onPressed: () {
                                if (state is RegisterLoading) {
                                  const Center(child: CupertinoActivityIndicator(color: Colors.orange,));
                                }
                                if (_formkey.currentState!.validate()) {
                                  getIt
                                      .get<RegisterBloc>()
                                      .add(RegisterAuthEvent(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                      ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size(750, 50)),
                              child: const Text(
                                'Sing up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have a accoun ?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {
                                  context.router.push(const LoginRoute());
                                },
                                child: const Text('Login now',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )))
                          ],
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(width: 50, height: 1, color: Colors.black),
                    const Text('or'),
                    Container(width: 50, height: 1, color: Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(10, 50),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.black,
                          )),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Github",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(10, 50),
                          backgroundColor: Colors.white,
                          side: const BorderSide()),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Google",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
