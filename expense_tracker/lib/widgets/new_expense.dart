import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  var _enteredTitle = '';
  void _saveTitle(inputText){
    _enteredTitle = inputText;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(40),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitle,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text("Title", style: TextStyle(fontSize: 38),),
            ),
            ),
            ElevatedButton(onPressed: (){
              print(_enteredTitle);
            }, 
            child: const Text("Save Title", style: TextStyle(fontSize: 38),)
            ),
        ],
      ),
      );
  }
}