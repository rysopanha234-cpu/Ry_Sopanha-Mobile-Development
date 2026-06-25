import 'package:flutter/material.dart';
import '../../../data/mock_grocery_data.dart';
import '../../../models/grocery.dart';
import 'grocery_form.dart';
import 'grocery_tile.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  List<GroceryItem> myGroceries = List.from(allGroceryItems);

  void addItem(GroceryItem item) {
    setState(() {
      myGroceries.add(item);
    });
  }

  void openModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => GroceryForm(onAdd: addItem),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    if (myGroceries.isNotEmpty) {
      content = ListView.builder(
        itemCount: myGroceries.length,
        itemBuilder: (context, index) {
          return GroceryTile(item: myGroceries[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: openModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}


  // ---------------------------------------------
    // Navigate to the form screen using showModalBottomSheet
    // ---------------------------------------------

    // https://api.flutter.dev/flutter/material/showModalBottomSheet.html

    // ---------------------------------------------
      //  Loop on groceries with an ListView builder
      //  For each grocery items, create a GroceryTile (grocery_tile.dart)
      // ---------------------------------------------
      // https://api.flutter.dev/flutter/widgets/ListView-class.html