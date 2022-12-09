import 'package:flutter/material.dart';
import 'soru.dart';
class TestVeri {
  int _count = 0;
  int dogruyanit=0;
  int yanlisyanit=0;
  final List <Soru> _soruBank = [
    Soru(soruMetni: 'Titanik gelmiş geçmiş en büyük gemidir.',
        soruYaniti: false),
    Soru(soruMetni: 'Titreşimin yaptığı yayılma hareketine dalga adı verilir.',
        soruYaniti: true),
    Soru(soruMetni: 'Kelvin bir sıcaklık ölçü birimidir.', soruYaniti: true),
    Soru(soruMetni: 'Şilep bir hava taşıtıdır.', soruYaniti: false),
    Soru(soruMetni: 'İngiltere,Kuzey Amerika kıtasındadır.', soruYaniti: false),
    Soru(soruMetni: 'Bir kişinin hem eltisi,hem görümcesi olamaz',
        soruYaniti: false),
    Soru(soruMetni: 'Ankara,bir dönem Selçuklu Devletine başketlik yapmıştır',
        soruYaniti: false),
    Soru(soruMetni: 'Dar açılı üçgende yükseklikler üçgenin içinde kesişir.',
        soruYaniti: true),
    Soru(soruMetni: 'TRT 7 adında bir ulusal Türk televizyon kanalı yoktur.',
        soruYaniti: true),


  ];


  int getdogru() {
    if(_soruBank[_count].soruYaniti==_soruBank[_count].soruMetni){
      dogruyanit++;
    }
    else{
      yanlisyanit++;
    }
    return dogruyanit;
  }
  int getyanlis() {
    if(_soruBank[_count].soruYaniti ==false){
      dogruyanit++;
    }
    else{
      yanlisyanit++;
    }
    return yanlisyanit;
  }
  String getSoruMetni() {

    return _soruBank[_count].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBank[_count].soruYaniti;
  }

  void sonrakisoru() {

    if (_count < _soruBank.length - 1) {
      _count++;
    }

  }

  bool testbitti() {
    if (_count >= _soruBank.length - 1) {
      _count++;
      return true;
    }
    else {
      return false;
    }
  }

  void testisifirla(){
    _count=0;

  }
  }

class RondomTestVeri extends  TestVeri {

int _count=0;
  @override
  void sonrakisoru() {
    if (_count < _soruBank.length - 1) {
      _count++;
    }
     else{
       _count=0;
    }
  }

}
