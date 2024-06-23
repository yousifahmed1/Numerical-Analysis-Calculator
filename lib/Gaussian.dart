import 'package:flutter/material.dart';
import 'home.dart';
class GaussianEliminationPage extends StatefulWidget {
  @override
  _GaussianEliminationPageState createState() => _GaussianEliminationPageState();
}

class _GaussianEliminationPageState extends State<GaussianEliminationPage> {
  TextEditingController matrix11Controller = TextEditingController();
  TextEditingController matrix12Controller = TextEditingController();
  TextEditingController matrix13Controller = TextEditingController();
  TextEditingController matrix14Controller = TextEditingController();
  TextEditingController matrix21Controller = TextEditingController();
  TextEditingController matrix22Controller = TextEditingController();
  TextEditingController matrix23Controller = TextEditingController();
  TextEditingController matrix24Controller = TextEditingController();
  TextEditingController matrix31Controller = TextEditingController();
  TextEditingController matrix32Controller = TextEditingController();
  TextEditingController matrix33Controller = TextEditingController();
  TextEditingController matrix34Controller = TextEditingController();

  String x1Result = '';
  String x2Result = '';
  String x3Result = '';

  List<List<double>> matrix1 = [];
  List<List<double>> matrix2 = [];
  List<List<double>> matrix3 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141414),

      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          // Set background color to black
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          // Handle button tap here
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => home()));

                        },
                        child: Image.asset('assets/back.png')),

                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gasuss Elimination  Method",
                    textAlign: TextAlign.center,
                    style: TextStyle(color:Color(0xffffffff),
                      fontSize: 45,
                      fontFamily: 'SomarSans',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ],
              ),

              SizedBox(height: 43,),

              Text(
                'Enter Matrix Values:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // Set text color to white
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              _buildMatrixRowInput('Row 1', matrix11Controller, matrix12Controller, matrix13Controller, matrix14Controller),
              _buildMatrixRowInput('Row 2', matrix21Controller, matrix22Controller, matrix23Controller, matrix24Controller),
              _buildMatrixRowInput('Row 3', matrix31Controller, matrix32Controller, matrix33Controller, matrix34Controller),
              SizedBox(height: 16.0),
              InkWell (
                onTap: performGaussianElimination,
                child: Container(
                  height: 52,
                  width: 178,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(39),
                  ),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight:FontWeight.w700,
                          fontSize: 23
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              Text(
                'Matrix 1:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // Set text color to white
                  color: Colors.white,
                ),
              ),
              _buildMatrixUI(matrix1),
              SizedBox(height: 16.0),
              Text(
                'Matrix 2:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // Set text color to white
                  color: Colors.white,
                ),
              ),
              _buildMatrixUI(matrix2),
              SizedBox(height: 16.0),
              Text(
                'Matrix 3:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // Set text color to white
                  color: Colors.white,
                ),
              ),
              _buildMatrixUI(matrix3),
              SizedBox(height: 16.0),
              Text(
                'Results:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // Set text color to white
                  color: Colors.white,
                ),
              ),
              Text('x1 = $x1Result', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('x2 = $x2Result', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('x3 = $x3Result', style: TextStyle(color: Colors.white,fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMatrixInput(String labelText, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        // Set border color to white
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        // Set text color to white
        labelStyle: TextStyle(color: Colors.white),
      ),
      keyboardType: TextInputType.number,
      controller: controller,
      // Set text color to white
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildMatrixRowInput(String labelText, TextEditingController controller1, TextEditingController controller2, TextEditingController controller3, TextEditingController controller4) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // Set text color to white
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildMatrixInput('', controller1)),
            SizedBox(width: 8.0),
            Expanded(child: _buildMatrixInput('', controller2)),
            SizedBox(width: 8.0),
            Expanded(child: _buildMatrixInput('', controller3)),
            SizedBox(width: 8.0),
            Expanded(child: _buildMatrixInput('', controller4)),
          ],
        ),
      ],
    );
  }

  Widget _buildMatrixUI(List<List<double>> matrix) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < matrix.length; i++)
          Text('[${matrix[i][0]}, ${matrix[i][1]}, ${matrix[i][2]}, ${matrix[i][3]}]', style: TextStyle(color: Colors.white,
          fontSize: 18,)),
      ],
    );
  }

  void performGaussianElimination() {
    List<List<double>> originalMatrix = [
      [double.parse(matrix11Controller.text), double.parse(matrix12Controller.text), double.parse(matrix13Controller.text), double.parse(matrix14Controller.text)],
      [double.parse(matrix21Controller.text), double.parse(matrix22Controller.text), double.parse(matrix23Controller.text), double.parse(matrix24Controller.text)],
      [double.parse(matrix31Controller.text), double.parse(matrix32Controller.text), double.parse(matrix33Controller.text), double.parse(matrix34Controller.text)],
    ];

    var results = gje(originalMatrix);

    setState(() {
      x1Result = results[0];
      x2Result = results[1];
      x3Result = results[2];
      matrix1 = results[3];
      matrix2 = results[4];
      matrix3 = results[5];
    });
  }

  void display(List<List<double>> matrix) {
    for (int i = 0; i < matrix.length; i++) {
      String row = "[ ";
      for (int j = 0; j < matrix[i].length; j++) {
        row += "${matrix[i][j].toStringAsFixed(0)} ";
      }
      row += "]";
      print(row);
    }
    print("");
  }

  List<dynamic> gje(List<List<double>> matrix) {
    double m21 = 0;
    double m31 = 0;
    double m32 = 0;

    List<List<double>> matrix1 = [];
    List<List<double>> matrix2 = [];
    List<List<double>> matrix3 = [];

    matrix1 = List.generate(matrix.length, (i) => List.from(matrix[i]));
    display(matrix1);

    m21 = matrix[1][0] / matrix[0][0];
    m31 = matrix[2][0] / matrix[0][0];

    for (int j = 0; j < matrix[0].length; j++) {
      double e2 = matrix[1][j];
      double e1 = m21 * matrix[0][j];
      matrix[1][j] = e2 - e1;
    }
    matrix2 = List.generate(matrix.length, (i) => List.from(matrix[i]));
    display(matrix2);

    for (int j = 0; j < matrix[0].length; j++) {
      double e3 = matrix[2][j];
      double e1 = m31 * matrix[0][j];
      matrix[2][j] = e3 - e1;
    }

    m32 = matrix[2][1] / matrix[1][1];

    for (int j = 0; j < matrix[0].length; j++) {
      double e3 = matrix[2][j];
      double e1 = m32 * matrix[1][j];
      matrix[2][j] = e3 - e1;
    }
    matrix3 = List.generate(matrix.length, (i) => List.from(matrix[i]));
    display(matrix3);


    double x3 = matrix[2][3] / matrix[2][2];
    double x2 = (matrix[1][3] - (matrix[1][2] * x3)) / matrix[1][1];
    double x1 = (matrix[0][3] - ((matrix[0][1] * x2) + (matrix[0][2] * x3))) / matrix[0][0];
    String x1Result = x1.toString();
    String x2Result = x2.toString();
    String x3Result = x3.toString();
    print("Gauss Jordan Result\nX1 = $x1\nX2 = $x2\nX3 = $x3");

    return [x1Result, x2Result, x3Result, matrix1, matrix2, matrix3];
  }
}
