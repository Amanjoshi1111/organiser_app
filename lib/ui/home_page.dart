import 'package:event_organiser/services/notification_services.dart';
import 'package:event_organiser/services/theme_services.dart';
import 'package:event_organiser/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: Scaffold(
        appBar: __appBar(),
        body: Column(
          children: const [
            Text(
              "Theme Data",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  __appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          setState(() {
            ThemeServices().switchTheme();
          });
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: !Get.isDarkMode
                  ? "Activated Dark Theme"
                  : "Activated Light Theme");

          notifyHelper.scheduledNotification();
        },
        child: const Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: const [
        Icon(
          Icons.person,
          size: 20,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
