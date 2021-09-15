import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:kidslean/login.dart';
import 'dart:convert';
import 'aimn.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController e1 = TextEditingController();
  TextEditingController e2 = TextEditingController();
  String ertext = '';
  var f = GlobalKey<FormState>();

  Future userlogin() async {
    Uri u = new Uri(
      path: "https://shazahinnawi.000webhostapp.com/apis/signup.php",
    );
    var respones =
        await http.post(u, body: {"phone": e1.text, "pass": e2.text});
    var data = json.decode(respones.body);
    if (data == "true") {
      Navigator.of(context).push(Anim(Page: Login()));
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
          'Pharmacy - Create acount',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/bb.jpg'),
          maxRadius: 20.0,
        ),
        backgroundColor: Colors.red[900],
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
                  Icon(Icons.perm_identity, size: 90.0, color: Colors.red[900]),
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
                            if (value.isEmpty) return 'enter your phone please';
                          },
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'phone number',
                            hintText: 'ex : 0988582010',
                            labelStyle: TextStyle(color: Colors.red[900]),
                            errorStyle: TextStyle(color: Colors.red),
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
                            labelStyle: TextStyle(color: Colors.red[900]),
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
                              return 'enter your Full Name please';
                          },
                          controller: e2,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Name',
                            hintText: 'ex :Shaza',
                            labelStyle: TextStyle(color: Colors.red[900]),
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
                              return 'enter your Address please';
                          },
                          controller: e2,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Address',
                            hintText: 'ex :8ss',
                            labelStyle: TextStyle(color: Colors.red[900]),
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
                                  return Colors.red[900];
                                return Colors
                                    .red[900]; // Use the component's default.
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
                        InkWell(
                            child: Text(
                              'back to login',
                              style: TextStyle(
                                  color: Colors.red[900], fontSize: 15.0),
                            ),
                            onTap: () {
                              Navigator.of(context).push(Anim(Page: Login()));
                            }),
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
              color: Colors.red[900],
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
