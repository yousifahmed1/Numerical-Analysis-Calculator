import 'package:flutter/material.dart';
import 'FalsePositionMethod.dart';
class FalseTablePage extends StatelessWidget {
  final List<Map<String, dynamic>> iterations;
  final double lastXR; // Assuming lastXR is the last XR value

  FalseTablePage({required this.iterations, required this.lastXR});

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
                    MaterialPageRoute(builder: (context) => FalsePage()),
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
                    DataColumn(label: Text('XL', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('f(XL)', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('XU', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('f(XU)', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('XR', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('f(XR)', style: TextStyle(color: Colors.white, fontSize: 18))),
                    DataColumn(label: Text('Error', style: TextStyle(color: Colors.white, fontSize: 18))),
                  ],
                  rows: iterations.map((iteration) {
                    return DataRow(
                      cells: [
                        DataCell(Text(iteration['iteration'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['xl'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['fxl'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['xu'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['fxu'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['xr'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
                        DataCell(Text(iteration['fxr'].toString(), style: TextStyle(color: Colors.white, fontSize: 18))),
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
