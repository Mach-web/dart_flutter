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
  void _presentDatePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(context: context, firstDate: firstDate, lastDate: now, initialDate: now);
  }
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
                      const Text("Select Date", style: TextStyle(fontSize: 35),),
                      IconButton(onPressed: _presentDatePicker, 
                      icon: const Icon(Icons.calendar_month_outlined), iconSize: 35,),
                    ],
                  ),
                  )
              ],
            ),
  
            const SizedBox(height: 20,),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("Cancel", style: TextStyle(fontSize: 35),
                    ),            
                ),
                const Spacer(),
                ElevatedButton(onPressed: (){}, 
                  child: const Text("Save Expense", style: TextStyle(fontSize: 35),)
                ),
              ],
            ),
        ],
      ),
    );
  }
}