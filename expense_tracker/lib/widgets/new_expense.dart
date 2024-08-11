import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key, required this.addExpense});
  final void Function(Expense expense) addExpense;

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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  
  void _presentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context, 
      firstDate: firstDate, 
      lastDate: now, 
      initialDate: now,
      builder: (context, child) => Transform.scale(scale: 1, child: child)
      );
    setState(() {
      _selectedDate = pickedDate;
    });

  }
  
  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final bool amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
        context: context, 
        builder: (ctx)=> AlertDialog(
          title: Text("Error Alert", style: Theme.of(context).textTheme.labelSmall,),
          content: Text("Enter a valid inputs", style: Theme.of(context).textTheme.labelSmall,),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, 
            child: Text("OK", style: Theme.of(context).textTheme.labelSmall,),)
          ],
        )
        );
        return;
    }
    widget.addExpense(
      Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory),);
      Navigator.pop(context);
  }
  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints){
      final width = constraints.maxWidth;
      return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          padding:  EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace+16),
          child: Column(
            children: [
              if(width >= 600)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Expanded(
                  child: TextField(
                  controller: _titleController,
                  // onChanged: _saveTitle,
                  maxLength: 50,
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration(
                    label: Text("Title", style: Theme.of(context).textTheme.labelSmall,),
                  ),
                  ),
                ),
                const SizedBox(width: 30,),
                Expanded(
                      child: TextField(
                        controller: _amountController,
                        style: Theme.of(context).textTheme.labelSmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixText: "\$ ",
                          label: Text("Amount", style: Theme.of(context).textTheme.labelSmall,)
                        ),
                      ),
                    ),
              ],)
              else
              TextField(
                controller: _titleController,
                // onChanged: _saveTitle,
                maxLength: 50,
                style: Theme.of(context).textTheme.labelMedium,
                decoration: InputDecoration(
                  label: Text("Title", style: Theme.of(context).textTheme.labelSmall,),
                ),
                ),
                if(width >= 600)
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values.map((category) =>
                        DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase(), style: Theme.of(context).textTheme.labelMedium,),
                          ),
                      ).toList(), 
                      onChanged: (value){
                        if(value == null){
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                      ),
                      const Spacer(),
                      Text(_selectedDate == null?"Select Date":dateFormatter.format(_selectedDate!), 
                            style: Theme.of(context).textTheme.labelMedium,),
                          IconButton(onPressed: _presentDatePicker, 
                          icon: const Icon(Icons.calendar_month_outlined), iconSize: 16,),
                  ],
                )
                else
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        style: Theme.of(context).textTheme.labelSmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixText: "\$ ",
                          label: Text("Amount", style: Theme.of(context).textTheme.labelSmall,)
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(child: 
                      Row(
                        // push content to end of the row
                        mainAxisAlignment: MainAxisAlignment.end,
                        // center content vertically
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null?"Select Date":dateFormatter.format(_selectedDate!), 
                            style: Theme.of(context).textTheme.labelMedium,),
                          IconButton(onPressed: _presentDatePicker, 
                          icon: const Icon(Icons.calendar_month_outlined), iconSize: 16,),
                        ],
                      ),
                      )
                  ],
                ),
          
                const SizedBox(height: 10,),
                const SizedBox(height: 8,),
                if(width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: Text("Cancel", style: Theme.of(context).textTheme.labelMedium,),            
                    ),
                    ElevatedButton(onPressed: _submitExpenseData, 
                      child: Text("Save Expense",  style: Theme.of(context).textTheme.labelMedium,)
                    ),
                    ],)
                else
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values.map((category) =>
                        DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase(), style: Theme.of(context).textTheme.labelMedium,),
                          ),
                      ).toList(), 
                      onChanged: (value){
                        if(value == null){
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                      ),
                    const Spacer(),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: Text("Cancel", style: Theme.of(context).textTheme.labelMedium,),            
                    ),
                    ElevatedButton(onPressed: _submitExpenseData, 
                      child: Text("Save Expense",  style: Theme.of(context).textTheme.labelMedium,)
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
    });
  }
}