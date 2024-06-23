// Import necessary packages
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:ssa/home.dart';
import 'Fixedpoint_table.dart';


class FixedPage extends StatefulWidget {
  @override
  _FixedPageState createState() => _FixedPageState();
}

class _FixedPageState extends State<FixedPage> {
  TextEditingController equationController = TextEditingController();
  TextEditingController rangeStartController = TextEditingController();
  TextEditingController rangeEndController = TextEditingController();
  TextEditingController errorcnt = TextEditingController();
  String result = '';

  double evaluateExpression(String equation, double x) {
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    cm.bindVariable(Variable('x'), Number(x));
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  double Fixed_Method(String equation, double start, double end, double tolerance,List<Map<String, dynamic>> iterations) {
    double xi = start;
    double xiPlus1 = 0;
    double error = 0;
    String first_error ="-";
    int iter = 0;


    double fxi = evaluateExpression(equation, xi);
    print(fxi);


    do {
      fxi = evaluateExpression(equation, xi);
      xiPlus1 = fxi;

        print("i=$iter | Xi= ${xi.toStringAsFixed(3)} | Xi+1= ${xiPlus1.toStringAsFixed(3)} | E= ${error.toStringAsFixed(3)}%");



        if (iter == 0) {
          iterations.add({
            'iteration': iter,
            'xi': xi.toStringAsFixed(3),
            'fxi': fxi.toStringAsFixed(3),
            'error': first_error,
          });

        }else{
          iterations.add({
            'iteration': iter,
            'xi': xi.toStringAsFixed(3),
            'fxi': fxi.toStringAsFixed(3),
            'error': error.toStringAsFixed(3),
          });

        }
        error = (((xiPlus1 - xi) / xiPlus1).abs())*100;

        xi = xiPlus1; // Update xi for the next iteration
        iter++;
      } while (error > tolerance);
    fxi = evaluateExpression(equation, xi);
    xiPlus1 = fxi;
    if (iter == 0) {
      iterations.add({
        'iteration': iter,
        'xi': xi.toStringAsFixed(3),
        'fxi': fxi.toStringAsFixed(3),
        'error': first_error,
      });

    }else{
      iterations.add({
        'iteration': iter,
        'xi': xi.toStringAsFixed(3),
        'fxi': fxi.toStringAsFixed(3),
        'error': error.toStringAsFixed(3),
      });

    }
      return xi;

  }

  void applyBisection() {
    String equation = equationController.text;
    double start = double.tryParse(rangeStartController.text) ?? 0.0;
    double end = double.tryParse(rangeEndController.text) ?? 0.0;
    double tolerance = double.tryParse(errorcnt.text) ?? 0.0;

    List<Map<String, dynamic>> iterations = [];
    double result = Fixed_Method(equation, start, end, tolerance, iterations);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FixedTablePage(iterations: iterations,lastXR:result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141414),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100,),
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
                Text("Simple Fixedpoint Method",
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

            //Enter The equation
            Container(
              height: 75,
              width: 705,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: TextField(
                  controller: equationController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    // Change this to the desired text color
                  ),
                  textAlign: TextAlign.center, // Center align the text

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter The equation",
                      hintStyle: TextStyle(
                        fontSize: 45,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w100,
                      )
                  ),              ),
              ),
            ),
            SizedBox(height: 43,),

            //Enter The XL
            Container(
              height: 75,
              width: 705,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: TextField(
                  controller: rangeStartController,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // Change this to the desired text color
                  ),
                  textAlign: TextAlign.center, // Center align the text
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter The Xo",
                      hintStyle: TextStyle(
                        fontSize: 44,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w100,
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 43,),



            //Enter The error
            Container(
              height: 75,
              width: 705,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: TextField(
                  controller: errorcnt,
                  style: TextStyle(
                    fontSize: 40,

                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // Change this to the desired text color
                  ),
                  textAlign: TextAlign.center, // Center align the text
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter The Error",
                      hintStyle: TextStyle(
                        fontSize: 44,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w100,
                      )
                  ),            ),
              ),
            ),
            SizedBox(height: 40.0),
            InkWell (
              onTap: applyBisection,
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
              result,
              style: TextStyle(fontSize: 18.0,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
