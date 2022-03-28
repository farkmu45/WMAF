import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();

  var _sliderValue = 1.0;
  var _checkBoxValue = false;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar form flutter'),
      ),
      body: Column(
        children: [
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'contoh: Faruk Maulana',
                  labelText: 'Nama lengkap',
                  icon: const Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: const Icon(Icons.security),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          CheckboxListTile(
            value: _checkBoxValue,
            onChanged: (value) => setState(() => _checkBoxValue = value!),
            title: const Text('Belajar Dasar Flutter'),
            subtitle: const Text('Dart, widget, http'),
            activeColor: Colors.deepPurpleAccent,
          ),
          SwitchListTile(
            value: _switchValue,
            onChanged: (value) => setState(() => _switchValue = value),
            title: const Text('Backend Programming'),
            subtitle: const Text('Dart, Nodejs, PHP, Java, dll'),
            activeTrackColor: Colors.pink[100],
            activeColor: Colors.red,
          ),
          Slider(
            value: _sliderValue,
            onChanged: (value) => setState(() => _sliderValue = value),
            min: 0,
            max: 100,
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Memproses data')),
                );
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
