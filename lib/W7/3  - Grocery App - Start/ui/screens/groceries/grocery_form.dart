
// // ---------------------------------------------
// // Create a new statefull widget : GroceryForm
// // ---------------------------------------------
  
// // The form shall be composed of 2 text fields:
// // -	Name of the grocery item
//  //-	Quantity (number only)

// // ⚠️  For now we don’t select the grocery type, we assume it’s always food

// // The form shall be composed of 2 buttons:
// //-	Cancel button
// // -	Add item button


// import 'package:flutter/material.dart';

// class GroceryForm extends StatefulWidget {
//   const GroceryForm({super.key});

//   @override
//   State<GroceryForm> createState() => _GroceryFormState();
// }

import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryForm extends StatefulWidget {
  final Function(GroceryItem) onAdd;

  const GroceryForm({super.key, required this.onAdd});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final itemName = TextEditingController();
  final itemQuantity = TextEditingController();
  String errorMessage = ''; 
  @override
  void dispose() {
    itemName.dispose();
    itemQuantity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB( 16, 16,16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: itemName,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Name'),
          ),

          TextField(
            controller: itemQuantity,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),

          if (errorMessage.isNotEmpty)
            Text(errorMessage, style: const TextStyle(color: Colors.red)),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (itemName.text.isEmpty) {
                    setState(() {
                      errorMessage = 'Please enter a name!'; 
                    });
                    return;
                  }
                  if (itemQuantity.text.isEmpty ||
                      int.tryParse(itemQuantity.text) == null) {
                    setState(() {
                      errorMessage =
                          'Please enter a valid quantity!'; 
                    });
                    return;
                  }

                  GroceryItem item = GroceryItem(
                    id: itemName.text,
                    name: itemName.text,
                    quantity: int.parse(itemQuantity.text),
                    category: GroceryCategory.other,
                  );

                  widget.onAdd(item);
                  Navigator.pop(context);
                },
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
