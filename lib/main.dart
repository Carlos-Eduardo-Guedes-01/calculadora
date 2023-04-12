import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() =>
    runApp(DevicePreview(enabled: true, builder: (context) => calculadora()));

// ignore: camel_case_types
class calculadora extends StatefulWidget {
  const calculadora({super.key});

  @override
  State<calculadora> createState() => _calculadoraState();
}

// ignore: camel_case_types
class _calculadoraState extends State<calculadora> {
  //contador de opração
  int cont = 0;
  //variavel de label
  String num = '';
  //primeiro valor do calculo
  var num2 = '';
  //segundo valor do calculo
  var num3 = '';
  //operação desejada
  var op = '';
  //historico de calculos
  var historico = [];
  void calcular(String tecla, String numero, var vet) {
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
      case ',':
        setState(() {
          //if (cont == 0) {
          num += tecla;
          //} else if (cont > 0) {
          //  num2 = tecla;
          //   cont = 0;
          //}
        });
        break;
      case 'AC':
        setState(() {
          num = '';
        });
        break;
      case '+/-':
        setState(() {
          double valor = 0;
          valor = double.parse(numero);
          valor *= -1;
          num = valor.toString();
        });
        break;
      case 'X':
        setState(() {
          num2 = numero;
          op = tecla;
          calcular('AC', numero, vet);
          cont += 1;
          op = 'X';
        });
        break;
      case '+':
        setState(() {
          num2 = numero;
          op = tecla;
          calcular('AC', numero, vet);
          cont += 1;
          op = '+';
        });
        break;
      case '-':
        setState(() {
          num2 = numero;
          op = tecla;
          calcular('AC', numero, vet);
          cont += 1;
          op = '-';
        });
        break;
      case '%':
        setState(() {
          num2 = numero;
          op = tecla;
          calcular('AC', numero, vet);
          cont += 1;
          op = '%';
        });
        break;
      case '/':
        setState(() {
          num2 = numero;
          op = tecla;
          calcular('AC', numero, vet);
          cont += 1;
          op = '/';
        });
        break;
      case '=':
        if (op == 'X') {
          setState(() {
            num3 = numero;
            double res = 0;
            res = double.parse(num2) * double.parse(num3);
            num = res.toString();
          });
        } else if (op == '%') {
          setState(() {
            num3 = numero;
            double res = 0;
            res = double.parse(num2) * double.parse(num3) / 100;
            num = res.toString();
          });
        } else if (op == '/') {
          setState(() {
            num3 = numero;
            double res = 0;
            res = double.parse(num2) / double.parse(num3);
            num = res.toString();
          });
        } else if (op == '-') {
          setState(() {
            num3 = numero;
            double res = 0;
            res = double.parse(num2) - double.parse(num3);
            num = res.toString();
          });
        } else if (op == '+') {
          setState(() {
            num3 = numero;
            double res = 0;
            res = double.parse(num2) + double.parse(num3);
            num = res.toString();
          });
        } else {
          setState(() {
            num = 'Unvalidate';
          });
          historico.add(num2 + op + num3 + tecla + num);
        }
        break;
      default:
        num = '';
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
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      num,
                      style: TextStyle(fontSize: 72),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('AC', '', ''),
                  child: const Text(
                    'AC',
                    style: TextStyle(
                      fontSize: 48,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('+/-', num, ''),
                  child: Text(
                    '+/-',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('%', num, ''),
                  child: Text(
                    '%',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('/', num, ''),
                  child: Text(
                    '/',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('7', '', '');
                  },
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('8', '', ''),
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('9', '', ''),
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('X', num, ''),
                  child: Text(
                    'X',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('4', '', ''),
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('5', '', ''),
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('6', '', ''),
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('-', num, '');
                  },
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('1', '', ''),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('2', '', ''),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('3', '', ''),
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('=', num, ''),
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('0', '', ''),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Text(
                  '',
                  style: TextStyle(fontSize: 48),
                ),
                GestureDetector(
                  onTap: () => calcular('.', '', ''),
                  child: Text(
                    ',',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('+', num, ''),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
