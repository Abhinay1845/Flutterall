import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  
  final _formkey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _salarycontroller = TextEditingController();
  final _loancontroller = TextEditingController();
  final _existingemicontroller = TextEditingController();
  final _tenurecontroller = TextEditingController();
  final _intrestcontroller = TextEditingController();

  String _result = "";
  double calculateEmi(double principal, double annualRate, double tenuremonths){
    double monthlyRate = annualRate / 12 / 100;
    return ((principal * monthlyRate * pow((1 + monthlyRate), tenuremonths))/ (pow(1 + monthlyRate, tenuremonths) - 1));
  }

  

  void _checkEligibility() {
    String name = _namecontroller.text; 
    int age = int.parse(_agecontroller.text);
    double salary = double.parse(_salarycontroller.text);
    double loan = double.parse(_loancontroller.text);
    double existingemi = double.parse(_existingemicontroller.text);
    double tenure = double.parse(_tenurecontroller.text);
    double intrest = double.parse(_intrestcontroller.text);

    double newemi = calculateEmi(loan, intrest, tenure);

    double dti = ((existingemi + newemi) / salary) * 100;
    String eligibility = "";
    if(age <= 21 || age >= 60){
      eligibility = "Not Eligible (Age should be in between 21 and 60)";
    }
    else if (loan > (10 * salary)){
      eligibility = "Not Eligible (Loan should not exceed 10 times of your salary)";
    }
    else if(dti > 60){
      eligibility = "Not Eligible (DTI exceeds 60%)";
    }
    else{
      eligibility = "Your Loan got approved.\n Customer: $name \n EMI: ₹${newemi.toStringAsFixed(2)} \n DTI: ${dti.toStringAsFixed(2)}";
    }
    setState(() {
      _result = eligibility;
    });
  }
  void _reset() {
    _namecontroller.clear();
    _agecontroller.clear();
    _salarycontroller.clear();
    _loancontroller.clear();
    _existingemicontroller.clear();
    _tenurecontroller.clear();
    _intrestcontroller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Loan Eligibility check",
      home: Scaffold(
        appBar: AppBar(title: Text("Loan Eligibility Check"), backgroundColor: Colors.lightGreen),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: _namecontroller,
                  decoration: InputDecoration(labelText: "Enter Name", border: OutlineInputBorder()),
                  validator: (value) => 
                    value == null || value.isEmpty ? "Enter Name" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _agecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Enter Age", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Enter valid age";
                    }
                    else if (int.tryParse(value) == null){
                      return "Enter valid number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _salarycontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Enter Salary", border: OutlineInputBorder()),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "The field is empty";
                    }
                    else if(int.tryParse(value) == null){
                      return "Invalid input";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _loancontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Enter required loan amount", border: OutlineInputBorder()),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "The field is empty";
                    }
                    else if(int.tryParse(value) == null){
                      return "Invalid input";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _existingemicontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Enter existing EMI", border: OutlineInputBorder()),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "The field is empty";
                    }
                    else if(int.tryParse(value) == null){
                      return "Invalid Input";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _tenurecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Enter the tenure in months", border: OutlineInputBorder()),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Field is empty";
                    }
                    else if(int.tryParse(value) == null){
                      return "Invalid input";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _intrestcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Enter the intrest percentage", border: OutlineInputBorder()),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "The field is empty";
                    }
                    else if(int.tryParse(value) == null){
                      return "Invalid input";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _checkEligibility, child: Text("Chech Eligibility")),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _reset, child: Text("Reset")),
                SizedBox(height: 10),
                Text(
                  _result,
                  style: TextStyle(
                    color: _result.contains("Eligible") ? Colors.red : Colors.lightGreen
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}