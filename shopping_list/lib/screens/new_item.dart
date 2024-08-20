import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

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
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: "1",
                    decoration: const InputDecoration(
                      label: Text("Quantity")
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: DropdownButtonFormField(
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
                      )
                    ],
                    onChanged: (value){}),
                )
              ],
            )
          ],
        )),
    );
  }
}