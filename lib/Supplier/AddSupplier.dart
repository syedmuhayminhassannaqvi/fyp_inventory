import 'package:flutter/material.dart';

class AddSupplierPage extends StatefulWidget {
  @override
  _AddSupplierPageState createState() => _AddSupplierPageState();
}

class _AddSupplierPageState extends State<AddSupplierPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _notification;

  void _showNotification(String message) {
    setState(() {
      _notification = message;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _notification = null;
      });
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the submit action
      // Here, you can save the supplier details or perform any other actions
      _showNotification('Supplier added successfully');
      _formKey.currentState!.reset();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        centerTitle: true,
        title: Text('Add Supplier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: _submitForm,
                    child: Material(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0), // Specify the desired radius for the top left corner
                            bottomLeft: Radius.circular(10.0), // Specify the desired radius for the bottom right corner
                            // You can adjust other corners as needed
                          )
                      ),
                      child: Container(height: 38,width: 200,
                        child: Center(
                          child: Text('Add',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.8)
                          ),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0), // Specify the desired radius for the top left corner
                            bottomLeft: Radius.circular(10.0), // Specify the desired radius for the bottom right corner
                            // You can adjust other corners as needed
                          ),
                      ),

                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _showNotification('Supplier updated successfully');
                    },
                    child: Material(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0), // Specify the desired radius for the top left corner
                            bottomRight: Radius.circular(10.0), // Specify the desired radius for the bottom right corner
                            // You can adjust other corners as needed
                          )
                      ),
                      child: Container(height: 38,width: 200,
                        child: Center(
                          child: Text('Update',style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF004096).withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0), // Specify the desired radius for the top left corner
                            bottomRight: Radius.circular(10.0), // Specify the desired radius for the bottom right corner
                            // You can adjust other corners as needed
                          ),
                      ),

                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20),
              if (_notification != null)
                Text(
                  _notification!,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
