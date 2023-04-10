import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
    DevicePreview(enabled: true, builder: (context) => const calculadora()));

// ignore: camel_case_types
class calculadora extends StatefulWidget {
  const calculadora({super.key});

  @override
  State<calculadora> createState() => _calculadoraState();
}

// ignore: camel_case_types
class _calculadoraState extends State<calculadora> {
  String num = '0';
  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        setState(() {
          num += tecla;
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          title: const Center(
            child: Text(
              'Calculadora',
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  num,
                  style: TextStyle(fontSize: 72),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'AC',
                  style: TextStyle(
                    fontSize: 48,
                  ),
                ),
                Text(
                  '+/-',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '%',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '/',
                  style: TextStyle(fontSize: 48),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('7');
                  },
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('8'),
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Text(
                  '9',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  'X',
                  style: TextStyle(fontSize: 48),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '4',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '5',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '6',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '-',
                  style: TextStyle(fontSize: 48),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '1',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '2',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '3',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '=',
                  style: TextStyle(fontSize: 48),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '0',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  ',',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  '+',
                  style: TextStyle(fontSize: 48),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
