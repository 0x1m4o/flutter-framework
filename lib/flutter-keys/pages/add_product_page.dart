import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class AddProductPage extends StatefulWidget {
  static const routeName = "/add-product";

  @override
  // ignore: library_private_types_in_public_api
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController titleController = TextEditingController();
  String selectedDate = DateFormat.yMMMMd().format(DateTime.now());

  DateTime? date;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              products.addProduct(titleController.text, date!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextField(
                autocorrect: false,
                controller: titleController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (date == null)
                          ? "No date chosen..."
                          : DateFormat().add_yMMMMd().format(date!),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                          initialDatePickerMode: DatePickerMode.day,
                          builder: (context, child) {
                            return Theme(data: ThemeData.dark(), child: child!);
                          },
                          confirmText: 'Pesan',
                          cancelText: 'Batalkan',
                        ).then((value) {
                          setState(() {
                            date = value;
                          });
                        });
                        // showDatePicker(
                        //   context: context,
                        //   initialDate: DateTime.now(),
                        //   firstDate: DateTime(2020),
                        //   lastDate: DateTime(2022),
                        // ).then(
                        //   (value) {
                        //     setState(() {
                        //       date = value;
                        //     });
                        //   },
                        // );
                      },
                      child: Text(
                        "Select Date",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
