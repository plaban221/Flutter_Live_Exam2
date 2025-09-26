
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Assigenment extends StatefulWidget {
  const Assigenment({super.key});

  @override
  State<Assigenment> createState() => _AssigenmentState();
}

class _AssigenmentState extends State<Assigenment> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();


  final List<Map<String, String>> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Number",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    if (_nameController.text.isNotEmpty &&
                        _numberController.text.isNotEmpty) {
                      setState(() {
                        contacts.add({
                          "name": _nameController.text,
                          "number": _numberController.text,
                        });
                        _nameController.clear();
                        _numberController.clear();
                      });
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
              const SizedBox(height: 10),
              contacts.isEmpty
                  ? const Center(
                child: Text(
                  "No contacts yet. Please add one.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return Card(
                    child: ListTile(
                      leading:
                      const Icon(Icons.person, color: Colors.brown),
                      title: Text(
                        contact["name"]!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(contact["number"]!),
                      trailing: const Icon(Icons.call,
                          color: Colors.blue),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
