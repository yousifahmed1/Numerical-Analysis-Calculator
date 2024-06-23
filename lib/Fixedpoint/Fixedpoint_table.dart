import 'package:flutter/material.dart';
import 'FixedpointMethod.dart';


class FixedTablePage extends StatelessWidget {
  final List<Map<String, dynamic>> iterations;
  final double lastXR; // Assuming lastXR is the last XR value

  FixedTablePage({required this.iterations, required this.lastXR});

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
                    MaterialPageRoute(builder: (context) => FixedPage()),
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
                    DataColumn(label: Text('Xi', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('f(Xi)', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('Error', style: TextStyle(color: Colors.white, fontSize: 18))),
                  ],
                  rows: iterations.map((iteration) {
                    return DataRow(
                      cells: [
                        DataCell(Text(iteration['iteration'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['xi'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['fxi'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
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
