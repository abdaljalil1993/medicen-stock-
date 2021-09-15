import 'package:flutter/material.dart';
import 'package:kidslean/addmed.dart';
import 'package:kidslean/aimn.dart';
import 'package:kidslean/stockmed.dart';
import 'package:kidslean/stockreq.dart';

class Stockhome extends StatelessWidget {
  String name;
  Stockhome(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock Section',
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
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.teal[200]),
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 4, color: Colors.grey, spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.2,
                    0.5,
                    0.7,
                    0.9
                  ],
                  colors: [
                    Colors.green[300],
                    Colors.white,
                    Colors.white,
                    Colors.teal[300]
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stock DashBoard',
                style: TextStyle(fontSize: 30, color: Colors.teal[900]),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(Anim(Page: Addmedicen(name)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Add Medicen'),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.teal[400];
                          return Colors
                              .teal[400]; // Use the component's default.
                        },
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(Anim(Page: Stockmed(name)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('My Medicen'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.teal[400];
                        return Colors.teal[400]; // Use the component's default.
                      },
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(Anim(Page: Stockreq(name)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('My Orders'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.teal[400];
                        return Colors.teal[400]; // Use the component's default.
                      },
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
