import 'package:life_expectancy/user_data.dart';

class Calculate {
  UserData _userData;
  Calculate(this._userData);

  //metot tanımlanıyor
  double calculator() {
    double sonuc;

    sonuc = 80 + _userData.sportDay - _userData.smokeNumber;
    sonuc = sonuc + (_userData.length / _userData.weight);

    // Ternary operatörün sonucunu sonuca atayarak doğru değeri alın
    sonuc = _userData.selectedGender == 'KADIN' ? sonuc + 3 : sonuc;
    return sonuc;

    // if (_userData.selectedGender == 'KADIN') {
    //   return sonuc + 3;
    // } else {
    //   return sonuc;
    // }
  }
}
