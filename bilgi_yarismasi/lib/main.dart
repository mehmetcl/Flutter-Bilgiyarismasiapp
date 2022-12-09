

import 'package:bilgi_yarismasi/test_veri.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(const KnowladgeTest());

class KnowladgeTest extends StatelessWidget {
  const KnowladgeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: const SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri test_1 = TestVeri();
  int dogru=0;
  int yanlis=0;
  void butonFonksiyonu(bool secilenButon) {

    if (test_1.testbitti() == true) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Bravo Testi Tamamladınız.'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[

                  const Text('Tekrar oynamak ister misin ?'),
                  Text('Doğru sayınız:$dogru'),
                  Text('Yanlış sayınız:$yanlis'),

                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Tekrar Oyna'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.testisifirla(); //count değerini sıfırladı
                    secimler = []; //
                    dogru=0;
                    yanlis=0;
                  });
                },
              ),

            ],
          );
        },
      );
    } else {
      setState(() {

      if(test_1.getSoruYaniti()==secilenButon){
          secimler.add(dogruIconu);
          dogru++;
        }
        else{
          secimler.add(yanlisIconu);
          yanlis++;
        }
        test_1.sonrakisoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //row vardı burda ekran taşıyordu

          spacing: 3,
          runSpacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);

                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            butonFonksiyonu(true);

                          },
                        ))),
              ])),
        ),
      ],
    );
  }
}

// ignore: empty_constructor_bodies
