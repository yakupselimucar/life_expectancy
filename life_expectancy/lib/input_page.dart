import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'hey_my_container.dart';
import 'my_icon.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender = 'ERKEK';
  double smokeNumber = 15;
  double sportDay = 3;
  int length = 170;
  int weight = 62;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: HeyMyContainer(
                    renk: Colors.yellow,
                    child: buildRowOutlinedbutton('BOY'),
                  ),
                ),
                Expanded(
                  child: HeyMyContainer(
                    renk: Colors.yellow,
                    child: buildRowOutlinedbutton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: HeyMyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Haftada Kaç Gün Spor Yapıyorsunuz?', style: textStyle),
                  Text('${sportDay.round()}', style: numberFormat),
                  Slider.adaptive(
                    value: sportDay,
                    divisions: 7,
                    onChanged: (double value) {
                      setState(
                        () {
                          sportDay = value;
                        },
                      );
                    },
                    //divisions: 7,
                    min: 0,
                    max: 7,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: HeyMyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Günde Kaç Sigara İçiyorsunuz?', style: textStyle),
                  Text('${smokeNumber.round()}',
                      //smokeNumber.round().toString()
                      style: numberFormat),
                  Slider(
                    value: smokeNumber,
                    onChanged: (double newValue) {
                      setState(() {
                        smokeNumber = newValue;
                      });
                    },
                    min: 0,
                    max: 30,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HeyMyContainer(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = 'KADIN';
                        },
                      );
                    },
                    renk:
                        selectedGender == 'KADIN' ? Colors.grey : Colors.yellow,
                    child: MyIcon(
                      whichIcon: FontAwesomeIcons.venus,
                      gender: 'KADIN',
                    ),
                  ),
                ),
                Expanded(
                  child: HeyMyContainer(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = 'ERKEK';
                        },
                      );
                    },
                    renk:
                        selectedGender == 'ERKEK' ? Colors.grey : Colors.yellow,
                    child: MyIcon(
                      whichIcon: FontAwesomeIcons.mars,
                      gender: 'Erkek',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 100,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          selectedGender: selectedGender,
                          smokeNumber: smokeNumber,
                          sportDay: sportDay,
                          length: length,
                          weight: weight),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'Hesapla',
                style: textStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlinedbutton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(label, style: textStyle),
        ),
        const SizedBox(width: 10),
        RotatedBox(
          quarterTurns: -1,
          child:
              Text(label == 'BOY' ? '$length' : '$weight', style: numberFormat),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'BOY' ? length += 1 : weight += 1;
                });
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.blueAccent,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  minimumSize: const Size(40, 40)),
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 10,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'KİLO' ? weight -= 1 : length -= 1;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blueAccent, width: 1),
                minimumSize: const Size.square(40),
              ),
              child: const Icon(
                FontAwesomeIcons.minus,
                size: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
