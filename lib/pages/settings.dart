import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/controllers/db_helper.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color bg = Colors.white;
  Color col = const Color.fromARGB(203, 87, 14, 190);
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
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bg,
          ),
          toolbarHeight: 0,
        ),
        body: FutureBuilder(
          future: getName(),
          builder: ((context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: customAppBar(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 25),
                    child: profilesection(user_name),
                  )
                ],
              ),
            );
          }),
        ));
  }

  Widget profilesection(String name) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(colors: [
            Colors.lightGreenAccent.shade100,
            Colors.lightGreenAccent.shade100.withOpacity(0.6),
          ])),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children:  [
                Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade200
                  ),
                  onPressed: (){}, child: Text('Edit'))
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const Icon(Icons.arrow_back, color: Colors.black, size: 38),
          const SizedBox(width: 60),
          const Icon(Icons.settings, color: Colors.black, size: 37),
          const SizedBox(width: 10),
          const Text(
            'Settings',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          SizedBox(
              height: 80,
              width: 100,
              child: Lottie.asset('assets/lottiefile/orange_help.json'))
        ],
      ),
    );
  }
}
