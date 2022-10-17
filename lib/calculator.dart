import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var number = '';
  var suffix = '';
  var firstnumber;
  var lastnumber;

  double? result;
  var operator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232732),
      appBar: AppBar(
        backgroundColor: Color(0xff232732),
        title: Center(
            child: Text(
          'Calculator',
          style: TextStyle(fontSize: 20),
        )),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.calculate),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            // ma: EdgeInsets.only(left: 10,right: 10),
            height: 240,
            width: double.infinity,
            color: Color(0xff232732),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, right: 10),
                  child: Text(
                    "$suffix",
                    style: TextStyle(color: Color(0xff616d7d), fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    '$number',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xff232732),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff657083),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                number = "";
                                suffix = '';
                                firstnumber = '';
                                result = 0;
                                operator = '';
                              });
                            },
                            child: Text(
                              'C',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff657083),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == '') {
                                  number = '';
                                } else {
                                  number =
                                      number.substring(0, number.length - 1);
                                  suffix =
                                      suffix.substring(0, suffix.length - 1);
                                }
                              });
                            },
                            child: Text(
                              '⌫',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff657083),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == '') {
                                  number = "";
                                } else {
                                  if (firstnumber == '') {
                                    operator = '%';
                                    suffix = suffix + '%';
                                    firstnumber = double.parse(number);
                                    number = '';
                                  }
                                }
                              });
                            },
                            child: Text(
                              '%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xffe7901e),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == '') {
                                  number = "";
                                } else {
                                  if (firstnumber == '') {
                                    operator = '÷';
                                    suffix = suffix + '÷';
                                    firstnumber = double.parse(number);
                                    number = '';
                                  } else {
                                    if (operator == '+') {
                                      operator = "÷";
                                      firstnumber =
                                          firstnumber + double.parse(number);
                                      number = '';
                                      suffix = suffix + '÷';
                                    } else if (operator == '-') {
                                      operator = '÷';
                                      suffix = suffix + '÷';
                                      firstnumber =
                                          firstnumber - double.parse(number);
                                      number = '';
                                    } else if (operator == 'x') {
                                      operator = '÷';
                                      firstnumber =
                                          firstnumber * double.parse(number);
                                      number = '';
                                      suffix = suffix + '÷';
                                    } else if (operator == '÷') {
                                      operator = '÷';
                                      suffix = suffix + '÷';
                                      firstnumber =
                                          firstnumber / double.parse(number);
                                      number = "";
                                    }
                                    // else if(operator=='%'){
                                    //   operator=='÷';
                                    //   firstnumber=firstnumber%double.parse(number);
                                    //   suffix=suffix+'÷';
                                    //   number='';
                                    // }

                                  }
                                }
                              });
                            },
                            child: Text(
                              '÷',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '7';
                                  suffix = suffix + '7';
                                } else {
                                  number = number + '7';
                                  suffix = suffix + '7';
                                }
                              });
                            },
                            child: Text(
                              '7',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == '') {
                                  number = '8';
                                  suffix = suffix + '8';
                                } else {
                                  number = number + '8';
                                  suffix = suffix + '8';
                                }
                              });
                            },
                            child: Text(
                              '8',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '9';
                                  suffix = suffix + '9';
                                } else {
                                  number = number + '9';
                                  suffix = suffix + '9';
                                }
                              });
                            },
                            child: Text(
                              '9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xffe7901e),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == '') {
                                  number = "";
                                } else {
                                  if (firstnumber == '') {
                                    operator = 'x';
                                    suffix = suffix + 'x';
                                    firstnumber = double.parse(number);
                                    number = '';
                                  } else {
                                    if (operator == '+') {
                                      operator = "x";
                                      firstnumber =
                                          firstnumber + double.parse(number);
                                      number = '';
                                      suffix = suffix + 'x';
                                    } else if (operator == '-') {
                                      operator = 'x';
                                      suffix = suffix + 'x';
                                      firstnumber =
                                          firstnumber - double.parse(number);
                                      number = '';
                                    } else if (operator == 'x') {
                                      operator = 'x';
                                      firstnumber =
                                          firstnumber * double.parse(number);
                                      number = '';
                                      suffix = suffix + 'x';
                                    } else if (operator == '÷') {
                                      operator = 'x';
                                      suffix = suffix + 'x';
                                      firstnumber =
                                          firstnumber / double.parse(number);
                                      number = "";
                                    }
                                    // else if(operator=='%'){
                                    //   operator='x';
                                    //   firstnumber=firstnumber%double.parse(number);
                                    //   suffix=suffix+'x';
                                    //   number='';
                                    // }

                                  }
                                }
                              });
                            },
                            child: Text(
                              'x',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '4';
                                  suffix = suffix + '4';
                                } else {
                                  number = number + '4';
                                  suffix = suffix + '4';
                                }
                              });
                            },
                            child: Text(
                              '4',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '5';
                                  suffix = suffix + '5';
                                } else {
                                  number = number + '5';
                                  suffix = suffix + '5';
                                }
                              });
                            },
                            child: Text(
                              '5',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '6';
                                  suffix = suffix + '6';
                                } else {
                                  number = number + '6';
                                  suffix = suffix + '6';
                                }
                              });
                            },
                            child: Text(
                              '6',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xffe7901e),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == '') {
                                  number = "";
                                } else {
                                  if (firstnumber == '') {
                                    operator = '-';
                                    suffix = suffix + '-';
                                    firstnumber = double.parse(number);
                                    number = '';
                                  } else {
                                    if (operator == '+') {
                                      operator = "-";
                                      firstnumber =
                                          firstnumber + double.parse(number);
                                      number = '';
                                      suffix = suffix + '-';
                                      print('plus $firstnumber');
                                    } else if (operator == '-') {
                                      operator = '-';
                                      suffix = suffix + '-';
                                      firstnumber =
                                          firstnumber - double.parse(number);
                                      number = '';
                                      print(firstnumber);
                                    } else if (operator == 'x') {
                                      operator = '-';
                                      suffix = suffix + '-';
                                      firstnumber =
                                          firstnumber * double.parse(number);
                                      number = '';
                                    } else if (operator == '÷') {
                                      operator = '-';
                                      suffix = suffix + '-';
                                      firstnumber =
                                          firstnumber / double.parse(number);
                                      number = "";
                                    }
                                    // else if(operator=='%'){
                                    //   operator='-';
                                    //   firstnumber=firstnumber%double.parse(number);
                                    //   suffix=suffix+'-';
                                    //   number='';
                                    // }

                                  }
                                }
                              });
                            },
                            child: Text(
                              '-',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '1';
                                  suffix = suffix + '1';
                                } else {
                                  number = number + '1';
                                  suffix = suffix + '1';
                                }
                              });
                            },
                            child: Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '2';
                                  suffix = suffix + '2';
                                } else {
                                  number = number + '2';
                                  suffix = suffix + '2';
                                }
                              });
                            },
                            child: Text(
                              '2',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '3';
                                  suffix = suffix + '3';
                                } else {
                                  number = number + '3';
                                  suffix = suffix + '3';
                                }
                              });
                            },
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xffe7901e),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == '') {
                                  number = "";
                                } else {
                                  if (firstnumber == '') {
                                    operator = '+';
                                    firstnumber = double.parse(number);
                                    suffix = suffix + '+';
                                    number = '';
                                  } else {
                                    if (operator == '-') {
                                      operator = "+";
                                      firstnumber =
                                          firstnumber - double.parse(number);
                                      number = '';
                                      suffix = suffix + '+';
                                      print('plus $firstnumber');
                                    } else if (operator == '+') {
                                      operator = '+';
                                      suffix = suffix + '+';
                                      firstnumber =
                                          firstnumber + double.parse(number);
                                      number = '';
                                      print(firstnumber);
                                    } else if (operator == 'x') {
                                      operator = '+';
                                      suffix = suffix + '+';
                                      firstnumber =
                                          firstnumber * double.parse(number);
                                      number = '';
                                    } else if (operator == '÷') {
                                      operator = '+';
                                      suffix = suffix + '+';
                                      firstnumber =
                                          firstnumber / double.parse(number);
                                      number = "";
                                    }
                                    // else if(operator=='%'){
                                    //   operator='+';
                                    //   suffix=suffix+'+';
                                    //   firstnumber=firstnumber%double.parse(number);
                                    //   number='';
                                    // }

                                  }
                                }
                              });
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Color(0xff383e4d),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (number == "") {
                                  number = '0';
                                  suffix = suffix + '0';
                                } else {
                                  number = number + '0';
                                  suffix = suffix + '0';
                                }
                              });
                            },
                            child: Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xff383e4d),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: Offset(2, 2))
                              ]),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (number == '') {
                                    number = '.';
                                  } else if (number.characters.contains('.')) {
                                    return null;
                                  } else {
                                    number = number + '.';
                                    suffix = suffix + '.';
                                  }
                                });
                              },
                              child: Text(
                                '.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w300),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffe7901e),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: Offset(2, 2))
                              ]),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (operator == '+') {
                                  lastnumber = double.parse(number);
                                  number = '';
                                  result = firstnumber + lastnumber;
                                  number = result.toString();
                                  firstnumber = '';
                                  lastnumber = '';
                                } else if (operator == '-') {
                                  lastnumber = double.parse(number);
                                  number = '';
                                  result = firstnumber - lastnumber;
                                  number = result.toString();
                                  firstnumber = '';
                                  lastnumber = '';
                                } else if (operator == 'x') {
                                  lastnumber = double.parse(number);
                                  number = '';
                                  result = firstnumber * lastnumber;
                                  number = result.toString();
                                  firstnumber = '';
                                  lastnumber = '';
                                } else if (operator == '÷') {
                                  lastnumber = double.parse(number);
                                  number = '';
                                  result = firstnumber / lastnumber;
                                  number = result.toString();
                                  firstnumber = '';
                                  lastnumber = '';
                                } else if (operator == '%') {
                                  lastnumber = double.parse(number);
                                  number = '';
                                  result = firstnumber % lastnumber;
                                  number = result.toString();
                                  firstnumber = '';
                                  lastnumber = '';
                                }
                              });
                            },
                            child: Text(
                              '=',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
