import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidslean/pharma.dart';
import 'package:kidslean/stock.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'aimn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController e1 = TextEditingController();
  TextEditingController e2 = TextEditingController();
  String ertext = '';
  var f = GlobalKey<FormState>();
  String name;
  Future userlogin() async {
    var respones = await http.post(
        Uri.parse("https://shazahinnawi.000webhostapp.com/apis/login.php"),
        body: {"email": e1.text, "pass": e2.text});
    var data = json.decode(respones.body);
    print(data['result']);
    print(data['type']);
    if (data['result'] == "true") {
      name = data['name'];
      if (data['type'] == "1")
        Navigator.of(context).push(Anim(Page: Stockhome(name)));
      else if (data['type'] == "2")
        Navigator.of(context).push(Anim(Page: Pharma(name)));
    } else {
      er();
    }
  }

  void er() {
    setState(() {
      ertext = 'password wrong';
      e1.text = '';
      e2.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pharmacy',
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
                  left: 28.0, right: 28.0, top: 33.0, bottom: 30.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Icon(Icons.medical_services, size: 80.0, color: Colors.teal),
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
                            if (value.isEmpty) return 'enter your email please';
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'phone number',
                            hintText: 'ex : 0988582010',
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
                            if (value.isEmpty)
                              return 'enter your password please';
                          },
                          controller: e2,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Password',
                            hintText: 'ex : ********',
                            labelStyle: TextStyle(color: Colors.teal),
                            errorStyle: TextStyle(color: Colors.teal),
                          ),
                        ),
                        SizedBox(
                          height: 69.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
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
                              child: Text('Log In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      backgroundColor: Colors.teal)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(ertext, style: TextStyle(color: Colors.teal)),
                        SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                            child: Text(
                              'Create new account',
                              style:
                                  TextStyle(color: Colors.teal, fontSize: 20.0),
                            ),
                            onTap: () {
                              Navigator.of(context).push(Anim(Page: Signup()));
                            })
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
                'Powered By Shaza - fatema - ola',
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
