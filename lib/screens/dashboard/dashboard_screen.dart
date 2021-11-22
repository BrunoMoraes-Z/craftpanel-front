import 'package:craft_panel/components/exit_button.dart';
import 'package:craft_panel/components/lateral_button.dart';
import 'package:craft_panel/components/my_toast.dart';
import 'package:craft_panel/constants.dart';
import 'package:craft_panel/enums/screen_type.dart';
import 'package:craft_panel/screens/login/login_screen.dart';
import 'package:craft_panel/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 1080,
            maxWidth: 1260,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: 40,
              top: 40,
              right: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        dashStore.serverName.value.length > 0
                            ? 'CraftPanel » ${dashStore.name}'
                            : 'CraftPanel',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 20),
                Divider(color: textColor),
                SizedBox(height: 25),
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: MediaQuery.of(context).size.height - 180,
                      child: Observer(
                        builder: (_) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Menu',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20),
                              LateralButton(
                                icon: FontAwesomeIcons.server,
                                text: 'Servidores',
                                focused: dashStore.getScreenType ==
                                    ScreenType.LIST_SERVERS,
                                onClick: () async {
                                  dashStore.toggle(ScreenType.LIST_SERVERS);
                                  dashStore.setServerName('');
                                },
                              ),
                              // LateralButton(
                              //   icon: FontAwesomeIcons.userAlt,
                              //   text: 'Conta',
                              //   onClick: () {},
                              // ),
                              ExitButton(
                                icon: Icons.logout,
                                text: 'Sair',
                                onClick: () {
                                  GetStorage().remove('server');
                                  GetStorage().remove('token');
                                  GetStorage().remove('list');
                                  GetStorage().remove('permissions');
                                  GetStorage().remove('view');
                                  GetStorage().remove('view_status');
                                  GetStorage().save();
                                  showToast(
                                    context: context,
                                    message: 'Logout realizado com sucesso.',
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) => LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 1080,
                        maxWidth: 910,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 180,
                        child: Observer(
                          builder: (_) {
                            return dashStore
                                .build(MediaQuery.of(context).size.width - 350);
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
