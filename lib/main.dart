import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => desihes(),
    },
  ));
}

class desihes extends StatelessWidget {
  double en;
  double boy;
  double agirlik;
  double desi;
  final _degerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.amber[300],
          child: Form(
            key: _degerKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('images/box.png')),
                  SizedBox(height: 30),
                  Text(
                    "KARGO DESİ HESAPLAMA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "ENİ",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.rulerHorizontal,
                          color: Colors.black,
                        )),
                    keyboardType: TextInputType.number,
                    onSaved: (parse) {
                      en = double.parse(parse);
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "BOYU",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.rulerVertical,
                          color: Colors.black,
                        )),
                    keyboardType: TextInputType.number,
                    onSaved: (parse) {
                      boy = double.parse(parse);
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "AĞIRLIĞI",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.weight,
                          color: Colors.black,
                        )),
                    keyboardType: TextInputType.number,
                    onSaved: (parse) {
                      agirlik = double.parse(parse);
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        color: Colors.amber[500],
                        child: Text("TEMİZLE"),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                      RaisedButton(
                        color: Colors.amber[500],
                        child: Text("HESAPLA"),
                        onPressed: () {
                          _degerKey.currentState.save();
                          debugPrint("EN: $en, BOY: $boy, AĞIRLIK : $agirlik");
                          desi = (en * boy * agirlik) / 3000;
                          if (en != 0 && boy != 0 && agirlik != 0) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.amber[300],
                                  title: Text(
                                      "Desi Hesaplama Sonucu : $desi desidir."),
                                  actions: [
                                    MaterialButton(
                                      child: Text("Tekrar Hesapla"),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/');
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.amber[300],
                                  title: Text("Yanlış Giriş Yaptınız."),
                                  actions: [
                                    MaterialButton(
                                      child: Text("Tekrar Hesapla"),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/');
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
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
      ),
    );
  }
}
