import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

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
  DateTime? _selectedDate;
  void _presentDatePicker () async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final datePicker = await showDatePicker(
      context: context, 
      firstDate: firstDate, 
      lastDate: now, 
      initialDate: now
      );
    setState(() {
      _selectedDate = datePicker;
    });
  }
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    style: const TextStyle(fontSize: 35),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: "\$ ",
                      label: Text("Amount", style: TextStyle(fontSize: 38),)
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(child: 
                  Row(
                    // push content to end of the row
                    mainAxisAlignment: MainAxisAlignment.end,
                    // center content vertically
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate==null? "Select Date":dateFormatter.format(_selectedDate!), 
                        style: const TextStyle(fontSize: 38),),
                      IconButton(onPressed: _presentDatePicker, 
                      icon: const Icon(Icons.calendar_month_outlined), iconSize: 38,),
                    ],
                  ),
                  )
              ],
            ),
  
            const SizedBox(height: 20,),
            const SizedBox(height: 16,),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase(),style: const TextStyle(fontSize: 32),),
                    ),
                  ).toList(),
                  onChanged: (value){
                    if(value==null){
                      return;
                    }
                    setState(() {
                      _selectedCategory=value;
                    });
                  }
                  ),
                const Spacer(),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("Cancel", style: TextStyle(fontSize: 32),
                    ),            
                ),
                const Spacer(),
                ElevatedButton(onPressed: (){}, 
                  child: const Text("Save Expense", style: TextStyle(fontSize: 32),)
                ),
              ],
            ),
        ],
      ),
    );
  }
}