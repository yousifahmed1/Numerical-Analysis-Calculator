import 'package:flutter/material.dart';
import 'SecantMethod.dart';


class SecantTablePage extends StatelessWidget {
  final List<Map<String, dynamic>> iterations;
  final double lastXR; // Assuming lastXR is the last XR value

  SecantTablePage({required this.iterations, required this.lastXR});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141414),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              SizedBox(height: 100),
              InkWell(
                onTap: () {
                  // Handle button tap here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecantPage()),
                  );
                },
                child: Image.asset('assets/back.png'),
              ),
              SizedBox(height: 50),

              Text(
                'Root =  ${lastXR.toStringAsFixed(3)}', // Display last XR value
                style: TextStyle(color: Colors.white,
                  fontSize: 40,
                  fontWeight:FontWeight.bold,
                ),
              ),

              SizedBox(height: 50),
              DividerTheme(
                data: DividerThemeData(color: Colors.white),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Iteration', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('xi-1', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('f(Xi-1)', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('xi', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('f(xi)', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('Error', style: TextStyle(color: Colors.white, fontSize: 18))),
                  ],
                  rows: iterations.map((iteration) {
                    return DataRow(
                      cells: [
                        DataCell(Text(iteration['iteration'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['xiMin1'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['FxiMin1'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['Xi'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['f(xi)'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['error'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
