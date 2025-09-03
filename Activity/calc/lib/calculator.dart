import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});
  @override
  State<calculator> createState() => _calcState();
}

class _calcState extends State<calculator> {
  String _output = "0";
  String _input = "";
  String _expression = "";
  double _num1 = 0;
  String _operator = "";
  bool _shouldClearDisplay = false;

  void _onButtonPress(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _output = "0";
        _input = "";
        _expression = "";
        _num1 = 0;
        _operator = "";
        _shouldClearDisplay = false;

      } else if (buttonText == "+/-") {
        if (_output != "0") {
          _output = _output.startsWith('-') ? _output.substring(1) : "-$_output";
          _input = _output;
          _expression = _expression + " ";
        }

      } else if (buttonText == "%") {
        if (_input.isNotEmpty && double.tryParse(_input) != null) {
          double value = double.parse(_input) / 100;
          _input = value.toString();
          _output = _input;
          _expression += " %";
        }

      } else if ("+-×÷=".contains(buttonText)) {
        // Operators and equals
        if (_input.isEmpty && buttonText != "=") {
          if (_output != "0") {
            _operator = buttonText;
            _shouldClearDisplay = true;
            _expression += " $_operator";
          }
          return;
        }

        if (buttonText == "=") {
          _calculate();
          // Optional: reflect "=" in expression (uncomment if you want it)
          // if (!_expression.endsWith("=")) _expression += " =";
        } else {
          if (_operator.isNotEmpty && !_shouldClearDisplay) {
            _calculate();
            _num1 = double.parse(_output);
          } else {
            _num1 = double.parse(_input);
          }

          _operator = buttonText;
          _shouldClearDisplay = true;

          // Normalize the operator spacing checks (always with leading space)
          if (_expression.endsWith(' +') ||
              _expression.endsWith(' -') ||
              _expression.endsWith(' ×') ||
              _expression.endsWith(' ÷')) {
            _expression =
                _expression.substring(0, _expression.length - 2) + " $_operator";
          } else {
            // Append operator after current input
            if (_expression.isEmpty) {
              _expression = _input + " $_operator";
            } else {
              _expression += " $_operator";
            }
          }
        }

      } else {
        // Numbers and '.'
        if (_shouldClearDisplay) {
          _input = "";
          _shouldClearDisplay = false;
        }

        if (buttonText == ".") {
          // If nothing typed yet, start with "0."
          if (_input.isEmpty) {
            _input = "0.";
          } else if (!_input.contains(".")) {
            _input += ".";
          } else {
            // Already has a decimal, ignore
            return;
          }
        } else {
          // Digits 0-9
          // Only replace the leading "0" if there is no decimal point
          if (_input == "0" && !_input.contains(".")) {
            _input = buttonText;
          } else {
            _input += buttonText;
          }
        }

        _output = _input;

        // --- Keep the expression in sync while typing ---
        if (_expression.endsWith("=") || _expression.isEmpty) {
          // Fresh start after "=", or beginning
          _expression = _input;
        } else if (_expression.endsWith(" +") ||
                   _expression.endsWith(" -") ||
                   _expression.endsWith(" ×") ||
                   _expression.endsWith(" ÷")) {
          // Just pressed an operator; start showing the new number
          _expression += " " + _input;
        } else {
          // We're continuing to type the current number:
          // replace only the last number token after the last space
          int lastSpace = _expression.lastIndexOf(' ');
          if (lastSpace == -1) {
            _expression = _input;
          } else {
            _expression = _expression.substring(0, lastSpace + 1) + _input;
          }
        }
      }
    });
  }

  void _calculate() {
    if (_operator.isEmpty || _input.isEmpty) {
      return;
    }
    double num2 = double.parse(_input);
    double result = 0;
    switch (_operator) {
      case "+":
        result = _num1 + num2;
        break;
      case "-":
        result = _num1 - num2;
        break;
      case "×":
        result = _num1 * num2;
        break;
      case "÷":
        if (num2 != 0) {
          result = _num1 / num2;
        } else {
          _output = "Error";
          _input = "";
          _num1 = 0;
          _operator = "";
          _shouldClearDisplay = true;
          return;
        }
        break;
    }
    if (result == result.toInt()) {
      _output = result.toInt().toString();
    } else {
      _output = result.toString();
    }
    _input = _output;
    _num1 = result;
    _operator = "";
    _shouldClearDisplay = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expression,
                      style: const TextStyle(
                        fontSize: 28.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      _output,
                      style: const TextStyle(
                        fontSize: 90.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1, color: Colors.transparent),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      text: "AC",
                      color: const Color(0xFFA5A5A5),
                      textColor: Colors.black,
                      onPressed: _onButtonPress,
                    ),
                    CalculatorButton(
                      text: "+/-",
                      color: const Color(0xFFA5A5A5),
                      textColor: Colors.black,
                      onPressed: _onButtonPress,
                    ),
                    CalculatorButton(
                      text: "%",
                      color: const Color(0xFFA5A5A5),
                      textColor: Colors.black,
                      onPressed: _onButtonPress,
                    ),
                    CalculatorButton(
                      text: "÷",
                      color: const Color(0xFFFE9E08),
                      textColor: Colors.white,
                      onPressed: _onButtonPress,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(text: "7", onPressed: _onButtonPress),
                    CalculatorButton(text: "8", onPressed: _onButtonPress),
                    CalculatorButton(text: "9", onPressed: _onButtonPress),
                    CalculatorButton(
                      text: "×",
                      color: const Color(0xFFFE9E08),
                      textColor: Colors.white,
                      onPressed: _onButtonPress,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(text: "4", onPressed: _onButtonPress),
                    CalculatorButton(text: "5", onPressed: _onButtonPress),
                    CalculatorButton(text: "6", onPressed: _onButtonPress),
                    CalculatorButton(
                      text: "-",
                      color: const Color(0xFFFE9E08),
                      textColor: Colors.white,
                      onPressed: _onButtonPress,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(text: "1", onPressed: _onButtonPress),
                    CalculatorButton(text: "2", onPressed: _onButtonPress),
                    CalculatorButton(text: "3", onPressed: _onButtonPress),
                    CalculatorButton(
                      text: "+",
                      color: const Color(0xFFFE9E08),
                      textColor: Colors.white,
                      onPressed: _onButtonPress,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      text: "0",
                      flex: 2,
                      onPressed: _onButtonPress,
                    ),
                    CalculatorButton(text: ".", onPressed: _onButtonPress),
                    CalculatorButton(
                      text: "=",
                      color: const Color(0xFFFE9E08),
                      textColor: Colors.white,
                      onPressed: _onButtonPress,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Function(String) onPressed;
  final int flex;

  const CalculatorButton({
    super.key,
    required this.text,
    this.color = const Color(0xFF333333),
    this.textColor = Colors.white,
    required this.onPressed,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          color: color,
          shape: flex == 1
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
          child: InkWell(
            onTap: () => onPressed(text),
            customBorder: flex == 1
                ? const CircleBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
            child: Container(
              height: 70,
              alignment: flex == 1 ? Alignment.center : Alignment.centerLeft,
              padding: EdgeInsets.only(left: flex == 2 ? 25 : 0),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
