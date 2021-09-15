import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stockreq extends StatefulWidget {
  String name;
  Stockreq(this.name);

  @override
  _StockreqState createState() => _StockreqState();
}

class _StockreqState extends State<Stockreq> {
  var item = [];
  Future alloffer() async {
    var res = await http.get(Uri.parse(
        "http://192.168.43.71/stockandpharmacy/apis/stockreq.php?sname=" +
            widget.name));
    var data = jsonDecode(res.body);
    setState(() {
      item = data;
    });
  }

  @override
  void initState() {
    alloffer();

    super.initState();
  }

  Future changestate(String x, String id) async {
    var res = await http.get(Uri.parse(
        "https://shazahinnawi.000webhostapp.com/apis/changestate.php?state=" +
            x +
            "&id=" +
            id));
    var data = jsonDecode(res.body);

    if (data['f'] == "true") {
      setState(() {
        alloffer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock-My Medicen',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/bbb.jpg'),
          maxRadius: 20.0,
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, i) {
            return listitem(item[i]['pharmaname'], item[i]['medname'],
                item[i]['qte'], item[i]['dt'], item[i]['id'], item[i]['state']);
          },
        ),
      ),
    );
  }

  Widget listitem(String pharmaname, String medname, String qte, String dt,
      String id, String state) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Details(id)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 3,
                color: Colors.teal,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Name : ' + pharmaname,
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF1A2036)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '  Medicen name: ' + medname,
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF1A2036)),
                      ),
                    )
                  ],
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            ' request date: ' + dt,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF6E0303)),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ' quantity: ' + qte,
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF03B83F)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("current state: " + state + "    "),
                        IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 33,
                            ),
                            onPressed: () {
                              changestate("Decline", id);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.add_circle_outline_sharp,
                              color: Colors.green,
                              size: 33,
                            ),
                            onPressed: () {
                              changestate("Accept", id);
                            }),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
