import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/LoginPage.dart';
import 'package:smile_app/provider/auth.dart';
//signup page for registering user.
class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUP> {
  bool isKeepLogin = false;
  bool isVisible = true;
  final firstnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  int score = 0;

  final passcontroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
        ),
        body: Form(
          key: _form,
          child: Consumer(builder: (context, ref, child) {
            // final loggedin = ref.watch(authprovider);
            return ListView(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                        child: Image.network(
                            "https://i.pinimg.com/736x/31/6d/86/316d8698b5c9abb78778d411a5d39544.jpg")),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: ((value) {
                      if (value == null) {
                        return "Value is Null";
                      } else {
                        return null;
                      }
                    }),
                    controller: firstnamecontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: " Full Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Email ",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Value is NULL";
                      } else {
                        return null;
                      }
                    },
                    controller: passcontroller,
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Password",
                        suffixIcon: InkWell(
                          child: isVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Value is NULL";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Confirm Password",
                        suffixIcon: InkWell(
                          child: isVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                          child: Text(
                        "Create New Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  ),
                  onTap: () async {
                    _form.currentState!.save();

                    if (_form.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      ref.watch(authprovider).signup(
                          firstnamecontroller.text.trim(),
                          emailcontroller.text.trim(),
                          passcontroller.text.trim(),
                          score);
                      // if (response != "Successfully") {
                      //   Get.defaultDialog(middleText: "Somthing Went Wrong");
                      // } else {
                      //   Get.defaultDialog(middleText: "Everything Fine");
                      // }

                      Get.to(() => const LoginPage());
                    } else {
                      return null;
                    }
                  },
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const LoginPage());
                    },
                    child: const Text("Already have an account? Login"))
              ],
            );
          }),
        ));
  }
}
