import 'package:bus_booking/src/view/search_page.dart';
import 'package:bus_booking/widget/custom_textstyle.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/rendering/box.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  bool isChecked = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Container(
            height: double.maxFinite,
            width: double.infinity,
            margin:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            padding: const EdgeInsets.all(10),
            // decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: myStyle(30, Colors.black),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Divider(color: Colors.grey, thickness: 0.8),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gapPadding: 3.0,
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      hintText: "Email",
                      labelText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Please enter a valid email";
                    }
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      suffix: TextButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible == true
                                ? passwordVisible = false
                                : passwordVisible = true;
                          });
                        },
                        child: Text(
                          "Show",
                          style: myStyle(15, Colors.grey),
                        ),
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gapPadding: 3.0,
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      hintText: "Password",
                      labelText: "Password",
                      hintStyle: const TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value!.length > 8) {
                      return "Please enter a strong password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Forgot password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: isChecked,
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "I read an agree with ecolines Rules and\n Privacy policy",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: myStyle(13, Colors.grey),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber),
                      height: 40,
                      // width: double.infinit,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Login",
                          style: myStyle(15, Colors.black),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => SearchTicket()),
                          (route) => false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 40,
                      // width: double.infinity,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Search for tickets",
                          style: myStyle(
                              15, const Color.fromARGB(255, 49, 10, 116)),
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
