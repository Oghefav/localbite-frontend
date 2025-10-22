import 'package:flutter/material.dart';

class MealDialog extends StatefulWidget {


  const MealDialog({super.key});

  @override
  _MealDialogState createState() => _MealDialogState();
}

class _MealDialogState extends State<MealDialog> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _description;
  late double _price;
  // late String _category;
  late String _imageUrl;
  late bool _isAvailable;

  @override
  void initState() {
    // super.initState();
    _name = 'ogbono';
    _description = 'kjfshdfajhf;kladsf;alk';
    _price = 459;
    _imageUrl = 'hgkghj';
    _isAvailable = true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text( 'Add New Meal or edit meal' ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Meal Name
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: '‘Meal Name’',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.fastfood),
                ),
               
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16),

              // Description
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(
                  labelText: '‘Description’',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 2,
               
                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 16),

              // Price
              TextFormField(
                initialValue: _price.toString(),
                decoration: InputDecoration(
                  labelText: '‘Price (₦)’',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return '‘Please enter price’';
                //   }
                //   If (double.tryParse(value) == null) {
                //     Return ‘Please enter valid price’;
                //   }
                //   Return null;
                // },
                onSaved: (value) => _price = double.parse(value!),
              ),
              SizedBox(height: 16),

              // // Category Dropdown
              // DropdownButtonFormField<String>(
              //   decoration: InputDecoration(
              //     labelText: ‘Category’,
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.category),
              //   ),
              //   items: categories.map((String category) {
              //     Return DropdownMenuItem<String>(
              //       Value: category,
              //       Child: Text(category),
              //     );
              //   }).toList(),
              //   onChanged: (value) => setState(() => _category = value!),
              // ),
              // SizedBox(height: 16),

              // Image URL
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(
                  labelText:" ‘Image URL (optional)’",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image),
                ),
                // onSaved: (value) => _imageUrl = value ?? ‘’,
              ),
              SizedBox(height: 16),

              // Availability Switch
              Row(
                children: [
                  Icon(Icons.visibility, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('‘Available for order’'),
                  Spacer(),
                  Switch(
                    value: _isAvailable,
                    onChanged: (value) => setState(() => _isAvailable = value),
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('‘Cancel’'),
        ),
        ElevatedButton(
          onPressed: _saveMeal,
          child: Text('widget.meal == null ? ‘Add Meal’ : ‘Update Meal’'),
          style: ElevatedButton.styleFrom(iconColor: Colors.green),
        ),
      ],
    );
  }

  void _saveMeal() {
    // If (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
      
    //   Final meal = Meal(
    //     Id: widget.meal?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
    //     Name: _name,
    //     Description: _description,
    //     Price: _price,
    //     Category: _category,
    //     imageUrl: _imageUrl,
    //     isAvailable: _isAvailable,
    //     createdAt: widget.meal?.createdAt ?? DateTime.now(),
    //   );

    //   widget.onSave(meal);
    //   Navigator.pop(context);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            
                ' ‘Meal added successfully!Meal updated successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

