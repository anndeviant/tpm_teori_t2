import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  CalculatePageState createState() => CalculatePageState();
}

class CalculatePageState extends State<CalculatePage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _oddEvenController = TextEditingController();
  double? _result;
  String? _oddEvenResult;

  void _calculate(String operation) {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      switch (operation) {
        case '+':
          _result = num1 + num2;
          break;
        case '-':
          _result = num1 - num2;
          break;
        case '*':
          _result = num1 * num2;
          break;
        case '/':
          _result = num2 != 0 ? num1 / num2 : double.nan;
          break;
      }
    });
  }

  void _checkOddEven() {
    final int number = int.tryParse(_oddEvenController.text) ?? 0;
    setState(() {
      _oddEvenResult = (number % 2 == 0) ? 'Genap' : 'Ganjil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Try to Calculate and see the Magic!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 8),
          Center(
            child: Image.asset(
              'assets/profiles/hutao.jpg',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 2),
          const Text('Kalkulator Sederhana',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextField(
            controller: _num1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Enter first number'),
          ),
          TextField(
            controller: _num2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Enter second number'),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _calculate('+'),
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('-'),
                child: const Text('-'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('*'),
                child: const Text('*'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('/'),
                child: const Text('/'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hasil:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _result != null ? '$_result' : '[Empty]',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 2),
          const SizedBox(height: 8),
          const Text('Input? Ganjil : Genap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextField(
            controller: _oddEvenController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Enter a number'),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: _checkOddEven,
              child: const Text('Check'),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hasil:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _oddEvenResult != null ? '$_oddEvenResult' : '[Empty]',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
