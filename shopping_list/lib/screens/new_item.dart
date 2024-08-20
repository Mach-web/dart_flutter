import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';

class NewItem extends StatefulWidget{
  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem>{
  final _formKey = GlobalKey<FormState>();
  String _enteredName = "";
  num _enteredNumber = 1;
  Category _enteredCategory = categories[Categories.carbs]!;

  void _saveItem(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print(_enteredName);
      print(_enteredNumber);
      print(_enteredCategory);
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name")
                ),
                validator: (value){
                  if(value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length > 50){
                    return "Enter a valid text between 1 and 50";
                  }
                  return null;
                },
                onSaved: (value)=>_enteredName = value!
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _enteredNumber.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Quantity")
                      ),
                      validator: (value) =>
                        value == null || value.isEmpty || int.tryParse(value) == null || int.tryParse(value)! < 0
                        ?  "Enter a valid positive number"
                        : null,
                      onSaved: (value){
                        _enteredNumber = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _enteredCategory,
                      items: [
                        for (final category in categories.entries) 
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(width: 16, height: 16, color: category.value.color),
                              const SizedBox(width: 10,),
                              Text(category.value.title)
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value){
                        _enteredCategory = value!;
                      }),
                  ),
                ],
              ),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){
                      _formKey.currentState!.reset();
                    }, 
                    child: const Text("Clear"),),
                  ElevatedButton(
                    onPressed: _saveItem, 
                    child: const Text("Save Expense"),),
                ],
              ),
            ],
          ),
        )),
    );
  }
}