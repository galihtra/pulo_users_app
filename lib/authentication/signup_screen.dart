import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/methods/common_methods.dart';
import 'package:users_app/pages/home_page.dart';
import 'package:users_app/widgets/loading_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController userPhoneTextEditingController =
      TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIfNetworkAvailable() {
    cMethods.checkConnectivity(context);

    signUpFormValidation();
  }

  signUpFormValidation() {
    if (userNameTextEditingController.text.trim().length < 3) {
      cMethods.displaySnackBar(
        "Your name must be atleast 4 or more characters.",
        context,
      );
    } else if (userPhoneTextEditingController.text.trim().length < 7) {
      cMethods.displaySnackBar(
        "Your number phone must be atleast 8 or more characters.",
        context,
      );
    } else if (!emailTextEditingController.text.contains("@")) {
      cMethods.displaySnackBar(
        "Please write valid email",
        context,
      );
    } else if (passwordTextEditingController.text.trim().length < 5) {
      cMethods.displaySnackBar(
        "Your password must be atleast 6 or more characters.",
        context,
      );
    } else {
      registerNewUser();
    }
  }

  registerNewUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDialog(messageText: "Registering your account..."),
    );

    final User? userFirebase = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    ).catchError((errorMsg) {
      Navigator.pop(context);
      cMethods.displaySnackBar(errorMsg.toString(), context);
    })).user;

    if (!context.mounted) return;
    Navigator.pop(context);

    DatabaseReference usersRef =
        FirebaseDatabase.instance.ref().child("users").child(userFirebase!.uid);

    Map userDataMap = {
      "name": userNameTextEditingController.text.trim(),
      "phone": userPhoneTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "id": userFirebase.uid,
      "blockStatus": "no",
    };

    usersRef.set(userDataMap);

    Navigator.push(context, MaterialPageRoute(builder: (c) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const Text(
                "Create a User's Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              // Text fields
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: userPhoneTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "User Phone",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        checkIfNetworkAvailable();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 10,
                        ),
                      ),
                      child: const Text("Sign Up"),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Already have an Account? Login Here",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
