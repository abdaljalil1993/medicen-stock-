import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kidslean/aimn.dart';

class Addmedicen extends StatefulWidget {
  String name;
  Addmedicen(this.name);
  @override
  _AddmedicenState createState() => _AddmedicenState();
}

class _AddmedicenState extends State<Addmedicen> {
  TextEditingController e1 = TextEditingController();
  TextEditingController e2 = TextEditingController();
  TextEditingController e3 = TextEditingController();
  TextEditingController e4 = TextEditingController();
  TextEditingController e5 = TextEditingController();
  TextEditingController e6 = TextEditingController();
  String ertext = '';
  var f = GlobalKey<FormState>();

  Future userlogin() async {
    var respones = await http.post(
        Uri.parse("https://shazahinnawi.000webhostapp.com/apis/addmed.php"),
        body: {
          "name": e1.text,
          "des": e2.text,
          "com": e3.text,
          "qte": e4.text,
          "price": e5.text,
          "cat": e6.text,
          "sname": widget.name,
        });
    var data = jsonDecode(respones.body);
    print(data['f']);

    if (data['f'] == "true") {
      setState(() {
        ertext = 'add Successfuly';
        e1.text = '';
        e2.text = '';
        e3.text = '';
        e4.text = '';
        e5.text = '';
        e6.text = '';
      });
    }
  }

  void er() {
    setState(() {
      ertext = 'add failed';
      e1.text = '';
      e2.text = '';
      e3.text = '';
      e4.text = '';
      e5.text = '';
      e6.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock-Add Medicen',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/bbb.jpg'),
          maxRadius: 20.0,
        ),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Container(
            decoration: BoxDecoration(),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, right: 28.0, top: 13.0, bottom: 30.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 3.0,
                  ),
                  Icon(Icons.add, size: 90.0, color: Colors.teal),
                  SizedBox(
                    height: 10.0,
                  ),
                  Form(
                    key: f,
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          controller: e1,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter Medicen Name';
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Medicen Name',
                            hintText: 'ex : setamol',
                            labelStyle: TextStyle(color: Colors.teal),
                            errorStyle: TextStyle(color: Colors.teal),
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter description';
                          },
                          controller: e2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'description',
                            hintText: 'ex : description',
                            labelStyle: TextStyle(color: Colors.teal),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 29.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'enter Company  Name please';
                          },
                          controller: e3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Company Name',
                            hintText: 'ex :latapharma',
                            labelStyle: TextStyle(color: Colors.teal),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 29.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter quantity please';
                          },
                          controller: e4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'quantity',
                            hintText: 'ex :8',
                            labelStyle: TextStyle(color: Colors.teal),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter Price please';
                          },
                          controller: e5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'price',
                            hintText: 'ex :2500',
                            labelStyle: TextStyle(color: Colors.teal),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter category please';
                          },
                          controller: e6,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'category',
                            hintText: 'ex :profeen',
                            labelStyle: TextStyle(color: Colors.teal),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.teal;
                                return Colors
                                    .teal; // Use the component's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (f.currentState.validate()) {
                                userlogin();
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Save',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23.0)),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(ertext, style: TextStyle(color: Colors.red)),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            Container(
              height: 50.0,
              color: Colors.teal,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                '** Pharmacy and Stock Application **',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
