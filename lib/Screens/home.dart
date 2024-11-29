import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//// Home Screen Started here
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _displayValue = '';
  double tax = 0;
  final List<String> items = ['2022-2023', '2023-2024'];
  String? selectedItem = '2023-2024';

  void _submitValue() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _displayValue =
            _controller.text.isEmpty ? 'Enter text' : _controller.text;
        if (selectedItem == '2023-2024') {
          tax = calculateTax(double.parse(_controller.text));
        } else if (selectedItem == '2022-2023') {
          tax = calculateTaxOld(double.parse(_controller.text));
        }
      });
    }
  }

  // Function for calculating tax
  double calculateTax(double monthlySalary) {
    double annualIncome = monthlySalary * 12;
    double tax = 0;
    if (annualIncome <= 600000) {
      tax = 0;
    } else if (annualIncome <= 1200000) {
      tax = (annualIncome - 600000) * 5 / 100;
    } else if (annualIncome <= 2200000) {
      tax = 30000 + (annualIncome - 1200000) * 15 / 100;
    } else if (annualIncome <= 3200000) {
      tax = 180000 + (annualIncome - 2200000) * 25 / 100;
    } else if (annualIncome <= 4100000) {
      tax = 430000 + (annualIncome - 3200000) * 30 / 100;
    } else if (annualIncome > 4100000) {
      tax = 700000 + (annualIncome - 4100000) * 35 / 100;
    }
    // Convert annual tax to monthly tax
    return tax / 12;
  }

  double calculateTaxOld(double monthlySalary) {
    double annualIncome = monthlySalary * 12;
    double tax = 0;
    if (annualIncome <= 600000) {
      tax = 0;
    } else if (annualIncome <= 1200000) {
      tax = (annualIncome - 600000) * 2.5 / 100;
    } else if (annualIncome <= 2400000) {
      tax = 15000 + (annualIncome - 1200000) * 12.5 / 100;
    } else if (annualIncome <= 3600000) {
      tax = 165000 + (annualIncome - 2400000) * 22.5 / 100;
    } else if (annualIncome <= 6000000) {
      tax = 435000 + (annualIncome - 3600000) * 27.5 / 100;
    } else if (annualIncome > 6000000) {
      tax = 1095000 + (annualIncome - 6000000) * 35 / 100;
    }
    // Convert annual tax to monthly tax
    return tax / 12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(50.0), // Sets the height of the AppBar
        child: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 0, 35, 65), // Sets the background color
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20, // Font size for the heading
              fontWeight: FontWeight.bold, // Bold text for heading
            ),
          ),
          //centerTitle: true, // Centers the title (optional)
        ),
      ),
      body: Container(
        //margin: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            //border: Border.all(color: Colors.black,)
            ),
        //alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'This is the latest tax calculator as per the 2024-2025 budget presented by the Government of Pakistan',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14), // Text styling
              ),
              const Text(
                "Enter Your Income",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Font size for the heading
                  fontWeight: FontWeight.bold, // Bold text for heading
                ),
              ),
              const SizedBox(height: 16),
              // here button click logic
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // Allows only digits (0-9)
                ],
                decoration: const InputDecoration(
                  labelText: 'Enter your salary',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 400, // Set the desired width
                child: DropdownButtonFormField<String>(
                  value: selectedItem,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 12.0,
                    ),
                  ),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: SizedBox(
                        width: 160, // Set a width for each dropdown item here
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis, // Avoid overflow
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue;
                    });
                  },
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                  onPressed: _submitValue,
                  style: OutlinedButton.styleFrom(
                      //color: Colors.red,
                      side: const BorderSide(
                    color: Color.fromARGB(255, 0, 35, 65),
                  )
                      //child: const Text('calculate'),
                      ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 35, 65), fontSize: 12),
                  )),
              const SizedBox(height: 16),
              if (_displayValue.isNotEmpty)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //const Expanded(
                      //child: Padding(
                      //padding: EdgeInsets.all(8.0),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Net Income:',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Monthly Tax:',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Monthly Income After Tax:',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Yearly Income:',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Yearly Tax:',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Yearly Income After Tax:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      //),
                      //),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Rs.$_displayValue',
                                  style: const TextStyle(fontSize: 14)),
                              const SizedBox(height: 12),
                              Text(
                                'Rs.$tax',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Rs.${int.parse(_displayValue) - tax}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Rs.${int.parse(_displayValue) * 12}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Rs.${tax * 12}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Rs.${(int.parse(_displayValue) * 12) - (tax * 12)}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // IntrinsicHeight(
              //     child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     if (_displayValue.isNotEmpty)
              //       const Text(
              //         'Details :',
              //         style: TextStyle(fontSize: 16),
              //       ),
              //     const SizedBox(height: 16),
              //     if (_displayValue.isNotEmpty)
              //       Text(
              //         'Your net pay is: $_displayValue',
              //         style: const TextStyle(fontSize: 14),
              //       ),
              //     const SizedBox(height: 12),
              //     if (_displayValue.isNotEmpty)
              //       Text(
              //         'Your monthly tax is: $tax',
              //         style: const TextStyle(fontSize: 14),
              //       ),
              //     const SizedBox(height: 12),
              //     if (_displayValue.isNotEmpty)
              //       Text(
              //         'Your monthly salary after tax is: ${int.parse(_displayValue) - tax}',
              //         style: const TextStyle(fontSize: 14),
              //       ),
              //     const SizedBox(height: 12),
              //     if (_displayValue.isNotEmpty)
              //       Text(
              //         'Your yearly income is: ${int.parse(_displayValue) * 12}',
              //         style: const TextStyle(fontSize: 14),
              //       ),
              //     const SizedBox(height: 12),
              //     if (_displayValue.isNotEmpty)
              //       Text(
              //         'Your yearly tax is: ${tax * 12}',
              //         style: const TextStyle(fontSize: 14),
              //       ),
              //     const SizedBox(height: 12),
              //     if (_displayValue.isNotEmpty)
              //       Text(
              //         'Your yearly income after tax is: ${(int.parse(_displayValue) * 12) - (tax * 12)}',
              //         style: const TextStyle(fontSize: 14),
              //       ),
              //   ],
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
