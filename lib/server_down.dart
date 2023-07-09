import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/baseController.dart';
import 'package:fyp_inventory/controller/url.dart';
import 'package:fyp_inventory/navigation_service.dart';

class ServerDown extends StatefulWidget {
  ServerDown({Key? key}) : super(key: key);

  @override
  State<ServerDown> createState() => _ServerDownState();
}

class _ServerDownState extends State<ServerDown> {
  final prefs = BaseController.getPrefs();

  var serverDown = true;

  NavigationService service = NavigationService();

  Future _onRefresh() async {
    try {
      prefs.setString("baseUrl", await BaseUrl.get());
    } catch (e) {
      serverDown = false;
    } finally {
      if (serverDown) {
        prefs.getString("token") == null ||
                await BaseController.checkAuthorization()
            ? service.routeTo("/")
            : service.routeTo("/homescreen");
      } else {
        serverDown = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse
              }),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.warning_amber,
                          size: 100,
                        ),
                        Text(
                          "Server is Down",
                          style: TextStyle(fontSize: 20),
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
