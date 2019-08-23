import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator-button.dart';
import 'calculator-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({@required this.onTap});

  final CalculatorButtonTapCallback onTap;
  final calculatorButtonRows = [
    ['6', '7', '8', '9', '10'],
    ['1', '2', '3', '4', '5'],
    ['0', '00', '000', '0000', '00000'],
    [Calculations.ADD, Calculations.SUBTRACT, Calculations.MULTIPLY, Calculations.DIVIDE, Calculations.REMAIN],
    [Calculations.PERIOD, Calculations.POWER, Calculations.REVERSE_INTEREST, Calculations.INTEREST, Calculations.DISCOUNT],
    [Calculations.BITMUL, Calculations.BITDIV, Calculations.EQUAL, Calculations.EQUAL, Calculations.EQUAL],
    [Calculations.CLEAR, Calculations.CLEAR, '', Calculations.EQUAL, Calculations.EQUAL]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: calculatorButtonRows.map((calculatorRowButtons) {
        return CalculatorRow(
          buttons: calculatorRowButtons,
          onTap: onTap,
        );
      }).toList()
    );
  }
}
