import 'package:flutter/material.dart';
import 'Cramer’s.dart';
import 'FalsePosition/FalsePositionMethod.dart';
import 'Fixedpoint/FixedpointMethod.dart';
import 'Gaussian.dart';
import 'LU.dart';
import 'Newton/NewtonMethod.dart';
import 'Secant/SecantMethod.dart';
import 'bisection/Bisection.dart';
import '';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141414),
      body: Container(
        decoration: BoxDecoration (
          image: DecorationImage (
              image: AssetImage('assets/pattern.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.03), BlendMode.dstATop),

          )
        ),

        child: Column(
          children: [
            SizedBox(height: 47,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/logo.png'), // Replace 'assets/photo.jpg' with your actual photo path
                  width: 131, // Specify the desired width
                  height: 131, // Specify the desired height
                  fit: BoxFit.cover, // Optional: Adjust the fit of the image within the specified dimensions
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("Numerical Analysis\nSystem Equalizer",
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.white,
                fontSize: 33,
                fontFamily: 'SomarSans',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 45,),
            Text("Select The Method",
              textAlign: TextAlign.center,
              style: TextStyle(color:Color(0xffF8B22E),
                fontSize: 72,
                fontFamily: 'SomarSans',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BisectionPage()));
                  },
                  child: Container(
                      width: 243,
                      height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Bisection",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 35,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                SizedBox(width: 35,),
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FalsePage()));
                  },
                  child: Container(
                    width: 243,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("False\nPostion",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 25,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                SizedBox(width: 35,),
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FixedPage()));
                  },
                  child: Container(
                    width: 243,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Simple Fixed\nPoint",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 25,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                SizedBox(width: 35,),
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewtenPage()));
                  },
                  child: Container(
                    width: 243,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Newton",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 35,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                SizedBox(width: 35,),
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecantPage()));
                  },
                  child: Container(
                    width: 243,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Secant",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 35,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),

              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GaussianEliminationPage()));
                  },
                  child: Container(
                    width: 243,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Gaussian\nElimination",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 25,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                SizedBox(width: 35,),
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LUPage()));
                  },
                  child: Container(
                    width: 243,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Lu",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 35,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                SizedBox(width: 35,),
                InkWell(
                  onTap: (
                      ) {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => cramersRulePage()));
                  },
                  child: Container(
                    width: 243,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Cramer’s rule",
                          textAlign: TextAlign.center,
                          style: TextStyle(color:Color(0xffFFFFFF),
                            fontSize: 35,
                            fontFamily: 'SomarSans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),

                  ),
                ),


              ],
            ),


          ],
        ),
      ),
    );
  }}
