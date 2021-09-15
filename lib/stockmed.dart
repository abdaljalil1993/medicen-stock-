import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stockmed extends StatefulWidget {
  String name;
  Stockmed(this.name);

  @override
  _StockmedState createState() => _StockmedState();
}

class _StockmedState extends State<Stockmed> {
  var item = [];
  Future alloffer() async {
    var res = await http.get(Uri.parse(
        "https://shazahinnawi.000webhostapp.com/apis/stockmed.php?sname=" +
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
            return listitem(item[i]['com'], item[i]['name'], item[i]['price'],
                item[i]['cat'], item[i]['description'], item[i]['qte']);
          },
        ),
      ),
    );
  }

  Widget listitem(String companyname, String medname, String price, String cat,
      String des, String qte) {
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
                      'Name : ' + medname,
                      style: TextStyle(fontSize: 18, color: Color(0xFF1A2036)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '  category: ' + cat,
                      style: TextStyle(fontSize: 18, color: Color(0xFF1A2036)),
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Company  :' + companyname,
                      style: TextStyle(fontSize: 15, color: Color(0xFF1A2036)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' Price: ' + price,
                      style: TextStyle(fontSize: 16, color: Color(0xFFDF1111)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' quantity: ' + qte,
                      style: TextStyle(fontSize: 15, color: Color(0xFF08EE54)),
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
