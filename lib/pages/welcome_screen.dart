import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/controllers/db_helper.dart';
import 'package:medi_app/pages/login_page.dart';
import 'package:medi_app/pages/navigationbar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  DbHelper dbHelper = DbHelper();
  String user_name = '';
  Future getName() async {
    String? name = await dbHelper.getName();

    if (name != null) {
      user_name = name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: FutureBuilder(
          future: getName(),
          builder: ((context, snapshot) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Lottie.asset(
                            'assets/lottiefile/welcome_robot.json'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            onPressed: () {
                              if (user_name != '') {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: ((context) =>
                                        const BottomNavBar())));
                              }
                              else
                              {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: ((context) =>
                                        const LoginPage())));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.navigate_next_sharp,
                                      color: Colors.white, size: 34),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ));
  }
}
