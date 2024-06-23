import 'package:flutter/material.dart';
import 'home.dart';
class cramersRulePage extends StatefulWidget {
  @override
  _cramersRulePageState createState() => _cramersRulePageState();
}

class _cramersRulePageState extends State<cramersRulePage> {
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

  double A = 0;
  double det_A1 = 0;
  double det_A2 = 0;
  double det_A3 = 0;



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
                  Text("Cramer’s rule",
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
                onTap: performCramer,
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
                'Results:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // Set text color to white
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text('Determinant of A = $A', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('A[1] = $det_A1', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('A[2] = $det_A2', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('A[3] = $det_A3', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('x1 = $det_A1', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('x2 = $det_A2', style: TextStyle(color: Colors.white,fontSize: 25)),
              Text('x3 = $det_A3', style: TextStyle(color: Colors.white,fontSize: 25)),


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

  void performCramer() {
    List<List<double>> originalMatrix = [
      [double.parse(matrix11Controller.text), double.parse(matrix12Controller.text), double.parse(matrix13Controller.text), double.parse(matrix14Controller.text)],
      [double.parse(matrix21Controller.text), double.parse(matrix22Controller.text), double.parse(matrix23Controller.text), double.parse(matrix24Controller.text)],
      [double.parse(matrix31Controller.text), double.parse(matrix32Controller.text), double.parse(matrix33Controller.text), double.parse(matrix34Controller.text)],
    ];

    var results = cramersRule(originalMatrix);
    print("method");



    setState(() {
      A = results[0];
      det_A1 = results[1];
      det_A2 = results[2];
      det_A3 = results[3];

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
  void copyMatrix(List<List<double>> src, List<List<double>> dest) {
    for (int i = 0; i < src.length; i++) {
      for (int j = 0; j < src[i].length; j++) {
        dest[i][j] = src[i][j];
      }
    }
  }


  List<dynamic> cramersRule(List<List<double>> matrix) {
    List<List<double>> tempMatrix =
    List.generate(3, (_) => List.generate(3, (_) => 0.0));
    List<double> detA = [0, 0, 0];
    double det = 0;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        tempMatrix[i][j] = matrix[i][j];
      }
    }
    det = (matrix[0][0] *
        (matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1])) -
        (matrix[0][1] *
            (matrix[1][0] * matrix[2][2] - matrix[1][2] * matrix[2][0])) +
        (matrix[0][2] *
            (matrix[1][0] * matrix[2][1] - matrix[1][1] * matrix[2][0]));
    print("Determinant of A = $det");

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        matrix[j][i] = matrix[j][3];
      }

      detA[i] = ((matrix[0][0] *
          (matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1])) -
          (matrix[0][1] *
              (matrix[1][0] * matrix[2][2] - matrix[1][2] * matrix[2][0])) +
          (matrix[0][2] *
              (matrix[1][0] * matrix[2][1] - matrix[1][1] * matrix[2][0]))) /
          det;
      copyMatrix(tempMatrix, matrix);
      print("A[${i + 1}] = ${detA[i]}");
    }

    for (int i = 0; i < 3; i++) {
      print("x${i + 1} = ${detA[i]}");
    }
    double detA1=detA[0];
    double detA2=detA[1];
    double detA3=detA[2];

    print(detA1);
    print(detA2);
    print(detA3);

    return [det, detA1,detA2,detA3];

  }}