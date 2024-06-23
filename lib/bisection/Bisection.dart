// Import necessary packages
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:ssa/home.dart';
import 'bisection_table.dart';

class BisectionPage extends StatefulWidget {
  @override
  _BisectionPageState createState() => _BisectionPageState();
}

class _BisectionPageState extends State<BisectionPage> {
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

  double bisectionMethod(String equation, double start, double end, double tolerance,List<Map<String, dynamic>> iterations) {
    double xl = start;
    double xu = end;
    double xrOld = 0;
    double error = 0;
    String first_error ="-";
    int iter = 0;

    double xr = 0;

    double fxl = evaluateExpression(equation, xl);
    print(fxl);

    double fxu = evaluateExpression(equation, xu);
    print(fxu);

    double fxr = evaluateExpression(equation, xr);
    print(fxr);
    if (fxl * fxu < 0) {
      do {
        xrOld = xr;
        xr = (xl + xu) / 2;
        error = ((xr - xrOld).abs() / xr )* 100;
        fxl = evaluateExpression(equation, xl);
        fxu = evaluateExpression(equation, xu);
        fxr = evaluateExpression(equation, xr);
        if (iter == 0) {
          print(
              "iteration: $iter | xl= ${xl.toStringAsFixed(3)} | f(xl)= ${fxl.toStringAsFixed(3)} | xu= ${xu.toStringAsFixed(3)} | f(xu)= ${fxu.toStringAsFixed(3)} | xr= ${xr.toStringAsFixed(3)} | f(xr)= ${fxr.toStringAsFixed(3)} | error = ${error.toStringAsFixed(3)} % | tolerance = -");
        } else {
          print(
              "iteration: $iter | xl= ${xl.toStringAsFixed(3)} | f(xl)= ${fxl.toStringAsFixed(3)} | xu = ${xu.toStringAsFixed(3)} | f(xu) = ${fxu.toStringAsFixed(3)} | xr = ${xr.toStringAsFixed(3)} | f(xr) = ${fxr.toStringAsFixed(3)} | error = ${error.toStringAsFixed(3)} %");
        }
        if (iter == 0) {
          iterations.add({
            'iteration': iter,
            'xl': xl.toStringAsFixed(3),
            'fxl': fxl.toStringAsFixed(3),
            'xu': xu.toStringAsFixed(3),
            'fxu': fxu.toStringAsFixed(3),
            'xr': xr.toStringAsFixed(3),
            'fxr': fxr.toStringAsFixed(3),
            'error': first_error,
          });

        }else{
          iterations.add({
            'iteration': iter,
            'xl': xl.toStringAsFixed(3),
            'fxl': fxl.toStringAsFixed(3),
            'xu': xu.toStringAsFixed(3),
            'fxu': fxu.toStringAsFixed(3),
            'xr': xr.toStringAsFixed(3),
            'fxr': fxr.toStringAsFixed(3),
            'error': error.toStringAsFixed(3),
          });

        }
        double m = fxl * fxr;
        if (m > 0) {
          xl = xr;
        } else if (m == 0) {
          return xr;
        } else {
          xu = xr;
        }

        iter++;

      } while ( error > tolerance);

      return xr;
    } else {
      print("Not correct xl and xu");
      return 0;
    }
  }

  void applyBisection() {
    String equation = equationController.text;
    double start = double.tryParse(rangeStartController.text) ?? 0.0;
    double end = double.tryParse(rangeEndController.text) ?? 0.0;
    double tolerance = double.tryParse(errorcnt.text) ?? 0.0;

    List<Map<String, dynamic>> iterations = [];
    double result = bisectionMethod(equation, start, end, tolerance, iterations);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TablePage(iterations: iterations,lastXR:result),
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
                Text("Bisection",
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
                      hintText: "Enter The XL",
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

            //Enter The XU
            Container(
              height: 75,
              width: 705,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: TextField(
                  controller: rangeEndController,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // Change this to the desired text color
                  ),
                  textAlign: TextAlign.center, // Center align the text

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter The XU",
                      hintStyle: TextStyle(
                        fontSize: 44,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w100,
                      )
                  ),            ),
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
