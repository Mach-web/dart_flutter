import 'package:flutter/material.dart';

class NewItem extends StatefulWidget{
  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text("Name")
              ),
              validator: (value) => "",
            )
          ],
        )),
    );
  }
}