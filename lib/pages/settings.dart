import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color bg = Colors.white;
  Color col = const Color.fromARGB(203, 87, 14, 190);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: bg,
        ),
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: customAppBar(),
            ),
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
          const Icon(Icons.settings, color: Colors.black, size: 37),
          const SizedBox(width: 30),
          const Text(
            'Settings',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          SizedBox(
              height: 80,
              width: 100,
              child: Lottie.network(
                  'https://assets2.lottiefiles.com/packages/lf20_GcxboJ.json'))
        ],
      ),
    );
  }
}
