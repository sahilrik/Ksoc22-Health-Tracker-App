import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medi_app/controllers/db_helper.dart';

class AddRoutine extends StatefulWidget {
  const AddRoutine({Key? key}) : super(key: key);

  @override
  State<AddRoutine> createState() => _AddRoutineState();
}

class _AddRoutineState extends State<AddRoutine> {
  Color bg = Colors.white;
  Color col = const Color.fromARGB(203, 87, 14, 190);

  bool critical = false;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _mfg = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: customAppBar(),
            ),
            const SizedBox(height: 60),
            medname(),
            const SizedBox(height: 10),
            priceQuantity(),
            const SizedBox(height: 10),
            mednote(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: col,
                        ),
                        onPressed: () {
                          DbHelper dbhelper = DbHelper();
                          dbhelper.addData(_name.text, int.parse(_price.text),
                              int.parse(_quantity.text), _note.text, critical);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(FontAwesomeIcons.fileMedical),
                              SizedBox(width: 12),
                              Text(
                                'Confirm',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 12),
                              Icon(Icons.add_task_outlined)
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget medname() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 2, color: col),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _name.text == '' ? 'Medicine Name' : _name.text,
                        style: TextStyle(
                          color: _name.text == ''
                              ? Colors.grey.shade600
                              : Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _name.text == '' ? 'Mfg. Company' : _name.text,
                        style: TextStyle(
                          color: _name.text == ''
                              ? Colors.grey.shade600
                              : Colors.grey.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.file_download_outlined,
                          color: Colors.grey.shade700, size: 38),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Dosage',
                    style: TextStyle(
                      color: Colors.purple.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _name,
                cursorColor: col,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Medicine',
                    labelText: 'Medicine Name',
                    labelStyle: const TextStyle(fontSize: 20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5)),
                    prefixIcon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: col,
                      size: 22,
                    )),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _mfg,
                cursorColor: col,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Mfg Company',
                    labelText: 'Company Name',
                    labelStyle: const TextStyle(fontSize: 20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5)),
                    prefixIcon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: col,
                      size: 22,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mednote() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 2, color: col),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _note.text == '' ? 'Special Instruction' : _name.text,
                        style: TextStyle(
                          color: _note.text == ''
                              ? Colors.grey.shade600
                              : Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Note',
                        style: TextStyle(
                          color: _name.text == ''
                              ? Colors.grey.shade600
                              : Colors.grey.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.file_download_outlined,
                          color: Colors.grey.shade700, size: 38),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              TextField(
                controller: _note,
                cursorColor: col,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Instructions',
                    labelText: 'Additional Advisory',
                    labelStyle: const TextStyle(fontSize: 20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5)),
                    prefixIcon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: col,
                      size: 22,
                    )),
              ),
              const SizedBox(height: 10),
              TextField(
                cursorColor: col,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Note',
                    labelText: 'Instructions',
                    labelStyle: const TextStyle(fontSize: 20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5)),
                    prefixIcon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: col,
                      size: 22,
                    )),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: Text(
                  "Critical",
                  style: TextStyle(
                      color: Colors.redAccent.shade400,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                value: critical,
                onChanged: (newValue) {
                  setState(() {
                    critical = !critical;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget priceQuantity() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 2, color: col),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _price.text == '' ? 'Medicine Price' : _price.text,
                        style: TextStyle(
                          color: _price.text == ''
                              ? Colors.grey.shade600
                              : Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _quantity.text == '' ? 'Quantity' : _quantity.text,
                        style: TextStyle(
                          color: _quantity.text == ''
                              ? Colors.grey.shade600
                              : Colors.grey.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.file_download_outlined,
                          color: Colors.grey.shade700, size: 38),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _price,
                keyboardType: TextInputType.number,
                cursorColor: col,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Price',
                    labelText: 'Medicine Cost',
                    labelStyle: const TextStyle(fontSize: 20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5)),
                    prefixIcon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: col,
                      size: 22,
                    )),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _quantity,
                keyboardType: TextInputType.number,
                cursorColor: col,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Number of Pills',
                    labelStyle: const TextStyle(fontSize: 20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5)),
                    prefixIcon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: col,
                      size: 22,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Container(
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(FontAwesomeIcons.arrowLeftLong,
                    color: Colors.white)),
            const SizedBox(width: 18),
            Text(
              'Add Plan',
              style: TextStyle(
                  color: bg, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(Icons.help_outline_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
