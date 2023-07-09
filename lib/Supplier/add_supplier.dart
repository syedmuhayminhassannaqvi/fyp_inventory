import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/supplierController.dart';
import 'package:fyp_inventory/navigation_service.dart';

class AddSupplierPage extends StatefulWidget {
  final int op;

  AddSupplierPage(this.op, {super.key});

  @override
  _AddSupplierPageState createState() => _AddSupplierPageState(op);
}

class _AddSupplierPageState extends State<AddSupplierPage> {
  static var _formKey;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final int op;

  bool _nameError = false;

  var errorText;

  _AddSupplierPageState(this.op);

  String? _notification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

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

  _add() async {
    if (_formKey.currentState!.validate()) {
      var res = await SupplierController.add(
          _nameController.text,
          _phoneController.text,
          _emailController.text.trim().isEmpty
              ? null
              : _emailController.text.trim(),
          _addressController.text.trim().isEmpty
              ? null
              : _addressController.text.trim());

      if (res["statusCode"] == 201) {
        _formKey.currentState!.reset();
        NavigationService().routeTo("supplier");
      } else if (res["statusCode"] == 422) {
        _showNotification(res["detail"]);
      } else {
        setState(() {
          errorText = res["detail"];
          _nameError = true;
        });
      }
    }
  }

  _update() async {
    if (_formKey.currentState!.validate()) {
      var res = await SupplierController.update(
          "1",
          _nameController.text,
          _phoneController.text,
          _emailController.text,
          _addressController.text);
      _showNotification(res.toString());
      _formKey.currentState!.reset();
      NavigationService().goBack();
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
        backgroundColor: const Color(0xFF004096).withOpacity(0.9),
        centerTitle: true,
        title: Text((op == 0) ? 'Add Supplier' : 'Update Supplier'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    errorText: _nameError ? errorText : null,
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
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    (op == 0) ? _add() : _update();
                  },
                  child: Material(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Container(
                      height: 38,
                      width: 200,
                      child: Center(
                        child: Text(
                          (op == 0) ? 'Add' : 'Update',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF004096).withOpacity(0.9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (_notification != null)
                  Text(
                    _notification!,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
