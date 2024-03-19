import 'dart:math';

import 'package:bootam_2024/ExpensesItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false, // Remove debug icon
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<double> expenses = [];
  List<String> expensesTitle = [];
  TextEditingController mycontroller = TextEditingController();
  TextEditingController mycontrollerAmount = TextEditingController();
  @override
  double _budget = 300;

  double totalExp() {
    double total = 0;
    for (var i = 0; i < expenses.length; i++) {
      total += expenses[i];
    }
    return total;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            AppBar(
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 50,
                    ),
                    Text(
                      "  Abdulrahman",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.farsan().fontFamily),
                    )
                  ],
                ),
              ),
              centerTitle: true,
              toolbarHeight: 50,
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 86, 214, 156),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('Daily Budget',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('$_budget SAR',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  const Text('Weekly Budget',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_drop_up,
                                          color: Colors.green, size: 40),
                                      Text('${1500 - totalExp()} SAR',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  const Text('Expenses',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_drop_down,
                                          color: Colors.red, size: 40),
                                      Text('${totalExp()} SAR',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Your expenses",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(
                                () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      padding: EdgeInsets.all(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Add Expense",
                                              style: TextStyle(fontSize: 30),
                                            ),
                                            TextField(
                                              controller: mycontroller,
                                              onChanged: (value) {
                                                setState(() {
                                                  mycontroller.text = value;
                                                  print(mycontroller.text);
                                                });
                                              },
                                              maxLength: 50,
                                              decoration: const InputDecoration(
                                                  label: Text('Expense name')),
                                            ),
                                            TextField(
                                              controller: mycontrollerAmount,
                                              onChanged: (value) {
                                                setState(() {
                                                  mycontrollerAmount.text =
                                                      value;
                                                  print(
                                                      mycontrollerAmount.text);
                                                });
                                              },
                                              maxLength: 50,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                  label:
                                                      Text('Expense Amount')),
                                            ),
                                            Row(
                                              children: [
                                                Spacer(),
                                                OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 86, 214, 156),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 86, 214, 156),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      expenses.add(double.parse(
                                                          mycontrollerAmount
                                                              .text));
                                                      expensesTitle.add(
                                                          mycontroller.text);
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (ctx, index) {
                          return ExpenseItem(
                            amount: expenses[index],
                            title: expensesTitle[index],
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 86, 214, 156),
          onPressed: () {
            setState(() {
              _budget = (_budget - totalExp());
            });
          },
          child: const Icon(Icons.calculate, color: Colors.white),
        ));
  }
}
