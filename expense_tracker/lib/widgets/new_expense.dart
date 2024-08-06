import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  /*var _enteredTitle = '';
  void _saveTitle(inputText){
    _enteredTitle = inputText;
  }*/
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(40),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: _saveTitle,
            maxLength: 50,
            style: const TextStyle(fontSize: 35),
            decoration: const InputDecoration(
              label: Text("Title", style: TextStyle(fontSize: 38),),
            ),
            ),
            TextField(
              controller: _amountController,
              style: const TextStyle(fontSize: 35),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixText: "\$ ",
                label: Text("Amount", style: TextStyle(fontSize: 38),)
              ),
            ),
            ElevatedButton(onPressed: (){}, 
            child: const Text("Clear text", style: TextStyle(fontSize: 38),
                ),            
            ),
            ElevatedButton(onPressed: (){
              // print(_enteredTitle);
              print(_titleController.text);
              print(_amountController.text);
            }, 
            child: const Text("Save Expense", style: TextStyle(fontSize: 38),)
            ),
        ],
      ),
    );
  }
}