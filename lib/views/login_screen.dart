import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_routs.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // align labels left
              children: [
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFFCE7A4C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                const Center(
                  child: Text(
                    "Welcome back to your account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),

                // 🔹 Phone Number Title + TextField
                const Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: auth.phoneController,
                  hintText: "Enter your phone number",
                  inputType: TextInputType.phone,
                ),
                const SizedBox(height: 20),

                // 🔹 Passcode Title + Fields
                const Text(
                  "Passcode",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // ⬅️ Align fields to the left
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: const EdgeInsets.only(
                          right: 12), // ⬅️ spacing between fields
                      width: 60,
                      child: TextField(
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.black54,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Color(0xFFCE7A4C)),
                          ),
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            auth.passcodeController.text += val;
                            if (index < 3) {
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).unfocus();
                            }
                          } else {
                            auth.passcodeController.text =
                                auth.passcodeController.text.substring(
                              0,
                              auth.passcodeController.text.length - 1,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // 🔹 Remember me + Forgot
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: auth.rememberMe,
                          onChanged: auth.toggleRemember,
                          activeColor: const Color(0xFFCE7A4C),
                          checkColor: Colors.white,
                          side: const BorderSide(color: Color(0xFFCE7A4C)),
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle forgot passcode logic
                      },
                      child: const Text(
                        "Forgot Passcode?",
                        style: TextStyle(color: Color(0xFFCE7A4C)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 🔹 Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (auth.login(auth.phoneController.text,
                          auth.passcodeController.text)) {
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCE7A4C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Register link
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have account? ",
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: const TextStyle(color: Color(0xFFCE7A4C)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle navigation to registration screen
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
