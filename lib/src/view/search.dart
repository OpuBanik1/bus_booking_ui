import 'package:bus_booking/widget/custom_textstyle.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _toController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime returnDate = DateTime(2024);
  List<String> list = <String>['1 adult', '2 adult', '3 adult', '4 adult'];
  List<String> currency = <String>['EUR', 'TK', 'DOLLAR', 'RUPE'];
  String sortBy = '1 adult';
  String selectedCurrency = 'EUR';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024, 03, 01),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    if (picked != null && picked != selectedDate) {
      setState(() {
        returnDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Search for tickets",
              style: myStyle(20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(
                  "Form",
                  style: myStyle(15, Colors.grey),
                ),
                subtitle: const Text("Riga"),
              )),
          const Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.blue,
                    size: 15,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
          TextField(
            controller: _toController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                suffixIcon: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(
                    "To",
                    style: myStyle(15, Colors.grey),
                  ),
                  subtitle: const Text('Kyiv(metro akademmistechko)'),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                      height: 80,
                      width: 200,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.calendar_today_rounded),
                              Text("Departure")
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: myStyle(20, Colors.grey),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Return"),
                        Text(
                          "${returnDate.toLocal()}".split(" ")[0],
                          style: myStyle(20, Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Image.asset(
                          'lib/icons/user.png',
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Passengers", style: myStyle(15, Colors.grey))
                    ],
                  ),
                  subtitle: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8),
                      height: 40,
                      child: DropdownButton<String>(
                        value: sortBy,
                        elevation: 1,
                        underline: Container(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String? value) {
                          setState(() {
                            sortBy = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: myStyle(20, Colors.blueGrey),
                            ),
                          );
                        }).toList(),
                      )))),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Currency:",
                style: myStyle(20, Colors.cyan),
              ),
              SizedBox(
                width: 5,
              ),
              DropdownButton<String>(
                value: selectedCurrency,
                elevation: 1,
                underline: Container(
                  width: 0,
                  color: Colors.transparent,
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (String? value) {
                  setState(() {
                    selectedCurrency = value!;
                  });
                },
                items: currency.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: myStyle(20, Colors.blueGrey),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber.withOpacity(0.7)),
            child: Center(
              child: Text(
                "Search",
                style: myStyle(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
