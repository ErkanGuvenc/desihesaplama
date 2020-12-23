import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => desihes(),
    },
  ));
}

class desihes extends StatelessWidget {
  int en;
  int boy;
  int agirlik;
  int desi;
  final _degerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _degerKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "ENİ",
                      labelStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.comment)),
                  keyboardType: TextInputType.number,
                  onSaved: (parse) {
                    en = int.parse(parse);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "BOYU",
                      labelStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.comment)),
                  keyboardType: TextInputType.number,
                  onSaved: (parse) {
                    boy = int.parse(parse);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "AĞIRLIĞI",
                      labelStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.comment)),
                  keyboardType: TextInputType.number,
                  onSaved: (parse) {
                    agirlik = int.parse(parse);
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      child: Text("TEMİZLE"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                    RaisedButton(
                      child: Text("HESAPLA"),
                      onPressed: () {
                        _degerKey.currentState.save();
                        debugPrint("EN: $en, BOY: $boy, AĞIRLIK : $agirlik");
                        desi = en * boy * agirlik;
                        if (en != 0 && boy != 0 && agirlik != 0) {
                          debugPrint("$desi");
                        } else {
                          debugPrint("hesaplama yanlış");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
