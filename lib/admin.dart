import 'package:flutter/material.dart';

class Adminhome extends StatelessWidget {
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
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo[200]),
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
                    Colors.indigo[300],
                    Colors.white,
                    Colors.white,
                    Colors.indigo[500]
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Admin DashBoard',
                style: TextStyle(fontSize: 30, color: Colors.indigo),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('All Stock'),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.indigoAccent;
                          return Colors
                              .indigoAccent; // Use the component's default.
                        },
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('All Orders'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.indigoAccent;
                        return Colors
                            .indigoAccent; // Use the component's default.
                      },
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('All Pharmacy'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.indigoAccent;
                        return Colors
                            .indigoAccent; // Use the component's default.
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
