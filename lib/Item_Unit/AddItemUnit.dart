import 'package:flutter/material.dart';
import 'package:fyp_inventory/controller/itemUnitController.dart';
import 'package:fyp_inventory/models/item_unit.dart';
import 'package:fyp_inventory/navigation_service.dart';

class AddItemUnit extends StatefulWidget {
  final int op;
  final ItemUnitAdd? itemUnitAdd;
  final int? id;

  AddItemUnit(this.op, {super.key, this.itemUnitAdd, this.id});

  @override
  _AddItemUnitState createState() => _AddItemUnitState(op, itemUnitAdd, id);
}

class _AddItemUnitState extends State<AddItemUnit> {
  static var _formKey;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final int op;
  int? id;

  ItemUnitAdd? itemUnitAdd;

  bool _titleError = false;

  var errorText;

  _AddItemUnitState(this.op, this.itemUnitAdd, this.id);

  String? _notification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    if (itemUnitAdd != null) {
      _titleController.text = itemUnitAdd!.iuTitle;
      _descriptionController.text = itemUnitAdd!.iuDescription ?? "";
    }
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

  _show(String message) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title:
                  op == 0 ? Text("Item Unit Added") : Text("Item Unit Updated"),
              content: Text(message),
              actions: [
                ElevatedButton(
                    onPressed: () => NavigationService().routeTo(
                        op == 0 ? "itemunit" : "itemunitdetail",
                        args: id),
                    child: Text("ok"))
              ],
            ));
  }

  _add() async {
    if (_formKey.currentState!.validate()) {
      // api call
      var res = await ItemUnitController.add(
          _titleController.text,
          _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim());

      if (res["statusCode"] == 201) {
        _formKey.currentState!.reset();
        _show(res["detail"]);
      } else if (res["statusCode"] == 422) {
        _showNotification(res["detail"]);
      } else if (res["statusCode"] == 401) {
        NavigationService().routeTo("", args: res["detail"]);
      } else {
        setState(() {
          errorText = res["detail"];
          _titleError = true;
        });
      }
    }
  }

  _update() async {
    if (_formKey.currentState!.validate()) {
      // api call
      var res = await ItemUnitController.update(
          id.toString(),
          _titleController.text,
          _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim());

      if (res["statusCode"] == 200) {
        _formKey.currentState!.reset();
        _show(res["detail"]);
      } else if (res["statusCode"] == 422) {
        _showNotification(res["detail"]);
      } else if (res["statusCode"] == 401) {
        NavigationService().routeTo("", args: res["detail"]);
      } else {
        setState(() {
          errorText = res["detail"];
          _titleError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004096).withOpacity(0.9),
        centerTitle: true,
        title: Text((op == 0) ? 'Add Item Unit' : 'Update Item Unit'),
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
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    errorText: _titleError ? errorText : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a Title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (op == 0) {
                      _add();
                    } else {
                      _update();
                    }
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
