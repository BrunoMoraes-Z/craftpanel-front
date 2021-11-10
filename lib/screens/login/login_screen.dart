import 'package:craft_panel/components/my_button.dart';
import 'package:craft_panel/components/my_text_field.dart';
import 'package:craft_panel/components/my_toast.dart';
import 'package:craft_panel/constants.dart';
import 'package:craft_panel/main.dart';
import 'package:craft_panel/screens/dashboard/dashboard_screen.dart';
import 'package:craft_panel/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Material(
          elevation: 15,
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 500,
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  child: Image.asset('assets/locked.png'),
                ),
                SizedBox(height: 40),
                MyTextField(
                  'Servidor',
                  (v) {
                    loginStore.setServer(v);
                  },
                  text: 'http://192.168.1.107:3000',
                  length: 40,
                ),
                SizedBox(height: 10),
                MyTextField(
                  'Usuário',
                  (v) {
                    loginStore.setUsername(v);
                  },
                  text: 'admin',
                  length: 20,
                ),
                SizedBox(height: 10),
                MyTextField(
                  'Senha',
                  (v) {
                    loginStore.setPassword(v);
                  },
                  text: 'admin',
                  length: 40,
                  obscure: true,
                ),
                SizedBox(height: 70),
                MyButton(
                  text: 'Entrar',
                  onClick: () {
                    if (loginStore.isFilled) {
                      api
                          .login(
                        server: loginStore.server.value,
                        username: loginStore.username.value,
                        password: loginStore.password.value,
                      )
                          .then(
                        (r) {
                          if (r) {
                            showToast(
                              context: context,
                              message: 'Login efetuado com Sucesso.',
                            );
                            Future.delayed(Duration(milliseconds: 500), () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DashboardScreen(),
                                ),
                              );
                            });
                          } else {
                            showToast(
                              context: context,
                              message: GetStorage().read('error'),
                              error: true,
                            );
                          }
                        },
                      );
                    } else {
                      showToast(
                        context: context,
                        message: 'Preencha os campos.',
                        error: true,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
