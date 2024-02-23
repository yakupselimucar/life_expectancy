import 'package:flutter/material.dart';
import 'package:life_expectancy/calculate_life.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beklenen Yaşam Süresi'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                //INTERPOLATION
                'Beklenen Yaşam Süreniz: \n ${Calculate(_userData).calculator().round()} Yıl',
                style: textStyle.copyWith(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'GERİ DÖN',
                style: textStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
