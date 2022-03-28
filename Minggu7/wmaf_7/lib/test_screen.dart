import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _regions = [
    'Islam',
    'Kristen Protestan',
    'Kristen Katolik',
    'Hindu',
    'Buddha'
  ];

  var _region = 'Islam';

  var _gender = '';

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mottoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text('Data Diri'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'Nama Lengkap',
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: _mottoController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Motto Hidup',
              labelText: 'Motto Hidup',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          RadioListTile(
            value: 'Laki-laki',
            groupValue: _gender,
            onChanged: (value) => _setGender(value.toString()),
            activeColor: Colors.blue,
            subtitle: const Text('Pilih ini jika anda laki-laki'),
          ),
          RadioListTile(
            value: 'Perempuan',
            groupValue: _gender,
            onChanged: (value) => _setGender(value.toString()),
            activeColor: Colors.blue,
            subtitle: const Text('Pilih ini jika anda perempuan'),
          ),
          Row(
            children: [
              const Text(
                'Agama',
                style: TextStyle(fontSize: 18.0, color: Colors.blue),
              ),
              const SizedBox(
                width: 10.0,
              ),
              DropdownButton<String>(
                value: _region,
                items: _regions
                    .map((region) => DropdownMenuItem(
                          child: Text(region),
                          value: region,
                        ))
                    .toList(),
                onChanged: (value) => _setRegion(value!),
              )
            ],
          ),
          ElevatedButton(onPressed: _sendData, child: const Text('OK'))
        ],
      ),
    );
  }

  void _setGender(String value) => setState(() => _gender = value);
  void _setRegion(String value) => setState(() => _region = value);
  void _sendData() {
    var alertDialog = AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nama Lengkap : ${_nameController.text}",
          ),
          Text(
            "Password : ${_passwordController.text}",
          ),
          Text(
            "Moto Hidup : ${_mottoController.text}",
          ),
          Text(
            "Jenis Kelamin : $_gender",
          ),
          Text(
            "Agama : $_region",
          ),
        ],
      ),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }
}
