import 'package:flutter/material.dart';



//// Slabs Screen Started here
class SlabScreen extends StatefulWidget {
  const SlabScreen({super.key, required this.title});
  final String title;

  @override
  State<SlabScreen> createState() => _SlabScreenState();
}


class _SlabScreenState extends State<SlabScreen> {
  final List<String> items = ['2022-2023', '2023-2024'];
  String? selectedItem = '2023-2024';
  String? fbrReformsNew = 'FBR Tax Reforms 2023-24';
  String? fbrReformsOld = 'FBR Tax Reforms 2022-23';


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
        //padding:const EdgeInsets.all(16.0), // Adds padding inside the container
        //margin: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.all(8.0),
        decoration:const BoxDecoration(
          //border: Border.all(color: Colors.black,),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Heading text
              selectedItem == '2023-2024' ? 
              Text(
                '$fbrReformsNew',
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Font size for the heading
                  fontWeight: FontWeight.bold, // Bold text for heading
                ),
              ) :
                  Text(
                '$fbrReformsOld',
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Font size for the heading
                  fontWeight: FontWeight.bold, // Bold text for heading
                ),
              ),
              const SizedBox(
                  height: 8.0), // Adds space between heading and main text
              IntrinsicWidth(
                child: SizedBox(
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
              ),
              const SizedBox(
                  height: 8.0), // Adds space between heading and main text
              // Main content text
              // Conditional rendering of Expanded widgets
              Expanded(
                child: selectedItem == '2023-2024'
                    ? SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income does not exceed Rs. 600,000, the rate of income tax is 0%.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 600,000 but does not exceed Rs. 1,200,000, the rate of income tax is 5% of the amount exceeding Rs. 600,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Add more content as needed
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 1,200,000 but does not exceed Rs. 2,200,000, the rate of income tax is Rs. 30,000 + 15% of the amount exceeding Rs. 1,200,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 2,200,000 but does not exceed Rs. 3,200,000, the rate of income tax is Rs. 180,000 + 25% of the amount exceeding Rs. 2,200,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 3,200,000 but does not exceed Rs. 4,100,000, the rate of income tax is Rs. 430,000 + 30% of the amount exceeding Rs. 3,200,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 4,100,000, the rate of income tax is Rs. 700,000 + 35% of the amount exceeding Rs. 4,100,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income does not exceed Rs. 600,000, the rate of income tax is 0%.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 600,000 but does not exceed Rs. 1,200,000, the rate of income tax is 2.5% of the amount exceeding Rs. 600,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 1,200,000 but does not exceed Rs. 2,400,000, the rate of income tax is Rs. 15,000 + 12.5% of the amount exceeding Rs. 1,200,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 2,400,000 but does not exceed Rs. 3,600,000, the rate of income tax is Rs. 165,000 + 22.5% of the amount exceeding Rs. 2,400,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 3,600,000 but does not exceed Rs. 6,000,000, the rate of income tax is Rs. 435,000 + 27.5% of the amount exceeding Rs. 3,600,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        "Where the taxable salary income exceeds Rs. 6,000,000, the rate of income tax is Rs. 1,095,000 + 35% of the amount exceeding Rs. 6,000,000.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
