import 'package:flutter/material.dart';

class AddPurchaseOrderItem extends StatefulWidget {
  @override
  _AddPurchaseOrderItemState createState() => _AddPurchaseOrderItemState();
}

class _AddPurchaseOrderItemState extends State<AddPurchaseOrderItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _purchaseOrderIdController = TextEditingController();
  final TextEditingController _purchaseOrderItemIdController = TextEditingController();
  final TextEditingController _purchaseOrderStatusController = TextEditingController();

  String? _notification;
  String? _selectedPurchaseOrderId;
  String? _selectedIId;

  List<String> _purchaseOrderIds = [
    'O001',
    'O002',
    'O003',
    'O004',
  ];

  List<String> _iIds = [
    'I1',
    'I2',
    'I3',
    'I4',
  ];

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
      // Here, you can save the purchase order item details or perform any other actions
      _showNotification('Purchase Order item added successfully');
      _formKey.currentState!.reset();
    }
  }

  @override
  void dispose() {
    _purchaseOrderIdController.dispose();
    _purchaseOrderItemIdController.dispose();
    _purchaseOrderStatusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004096).withOpacity(0.9),
        centerTitle: true,
        title: Text('Add Purchase Order Item'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedPurchaseOrderId,
                  onChanged: (value) {
                    setState(() {
                      _selectedPurchaseOrderId = value;
                    });
                  },
                  items: _purchaseOrderIds.map((purchaseOrderId) {
                    return DropdownMenuItem<String>(
                      value: purchaseOrderId,
                      child: Text(purchaseOrderId),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Purchase Order ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a purchase order ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedIId,
                  onChanged: (value) {
                    setState(() {
                      _selectedIId = value;
                    });
                  },
                  items: _iIds.map((iId) {
                    return DropdownMenuItem<String>(
                      value: iId,
                      child: Text(iId),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'I_ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an I_ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _purchaseOrderItemIdController,
                  decoration: InputDecoration(
                    labelText: 'Purchase Order Item ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a purchase order item ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _purchaseOrderStatusController,
                  decoration: InputDecoration(
                    labelText: 'Purchase Order Status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a purchase order status';
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
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Container(
                          height: 38,
                          width: 200,
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showNotification('Supplier updated successfully');
                      },
                      child: Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Container(
                          height: 38,
                          width: 200,
                          child: Center(
                            child: Text(
                              'Update',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF004096).withOpacity(0.9),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
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
      ),
    );
  }
}
