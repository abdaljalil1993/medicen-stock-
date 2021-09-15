import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pharmareq extends StatefulWidget {
  String name;
  Pharmareq(this.name);
  @override
  _PharmareqState createState() => _PharmareqState();
}

class _PharmareqState extends State<Pharmareq> {
  var item = [];
  Future alloffer() async {
    var res = await http.get(Uri.parse(
        "https://shazahinnawi.000webhostapp.com/apis/pharmareq.php?sname=" +
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pharmacy-My Request',
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
            return listitem(item[i]['stockname'], item[i]['medname'],
                item[i]['qte'], item[i]['state']);
          },
        ),
      ),
    );
  }

  Widget listitem(String stockname, String medname, String qte, String state) {
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
                      'Medicen-Name:' + medname,
                      style: TextStyle(fontSize: 15, color: Color(0xFF1A2036)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '  Stock-Name: ' + stockname,
                      style: TextStyle(fontSize: 15, color: Color(0xFF1A2036)),
                    ),
                  )
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Quantity  :' + qte,
                      style: TextStyle(fontSize: 15, color: Color(0xFFE90A16)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'State  :' + state,
                      style: TextStyle(fontSize: 15, color: Color(0xFF4506F3)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
