import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/view/firstScreen.dart';
import 'package:smile_app/provider/auth.dart';
import 'package:smile_app/provider/authStream.dart';
import 'package:smile_app/provider/loginProvider.dart';
import 'package:smile_app/signup.dart';


//login page for authentication 
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  final _form = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final islogin = ref.watch(loginprovider);
        return Form(
          key: _form,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red[400],
                elevation: 0,
              ),
              body: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)))),
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      validator: ((value) {
                        if (value == null) {
                          return "Value is Empty";
                        } else {
                          return null;
                        }
                      }),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter Email or Username"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      validator: ((value) {
                        if (value == null) {
                          return "Value is Empty";
                        } else {
                          return null;
                        }
                      }),
                      controller: passcontroller,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter Password",
                          suffixIcon: Icon(Icons.visibility)),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Checkbox(
                        value: islogin,
                        onChanged: (value) {
                          ref.read(loginprovider.notifier).loginstate();
                        },
                      ),
                      Text("Keep me login"),
                      SizedBox(
                        width: 100,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                      ),
                    ),
                    onTap: () async {
                      // Get.to(() => FirstScreen());
                      _form.currentState!.save();
                      if (_form.currentState!.validate()) {
                        final response = await ref.read(authprovider).login(
                            emailcontroller.text.trim(),
                            passcontroller.text.trim());

                        print("$response");
                        if (response != "Successfully") {
                          Get.defaultDialog(
                              title: "Error! ",
                              middleText: "Invalid Username/Password ");
                        } else {
                          Get.to(() => FirstScreen());
                        }
                      } else {
                        return Get.defaultDialog(title: "Validation Error");
                      }
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SignUP();
                        }));
                      },
                      child: Text("Create Account"))
                ],
              )),
        );
      },
    );
  }
}
