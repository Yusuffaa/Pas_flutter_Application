import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_flutter/controller/Login_Controller.dart';

class LoginCloneFixPage extends StatelessWidget {
  LoginCloneFixPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Instagram',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: controller.txtUsername,
                  decoration: InputDecoration(hintText: 'Input Username'),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: controller.txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Input Password'),
                ),

                Obx(
                  () => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : OutlinedButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text("Login"),
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
