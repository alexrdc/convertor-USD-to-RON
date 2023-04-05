import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@override
void main() {
  runApp(const crypto_exchange());
}

class crypto_exchange extends StatelessWidget {
  const crypto_exchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  final _controller = TextEditingController();
  String _result = '';

  void _calculate() {
    final value = int.tryParse(_controller.text) ?? 0;
    final result = value * 4.5;
    setState(() {
      _result = '$value USD = $result RON';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Center(
        child: Text(
          'Convert USD to RON',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [ Image.network('https://res.cloudinary.com/etoro/image/fetch/w_1.5/https://etoro-cdn.etorostatic.com/market-avatars/83/150x150.png',
            ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter the value',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _controller,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
                ),
                  onPressed: _calculate,
                  child: const Text(
                      ' CONVERT ',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
              ),
              Text(_result),
            ]
          ),
        ),
      ),
    );
  }
}
