import 'package:flutter/material.dart';

class PigPage extends StatefulWidget {
  const PigPage({Key? key}) : super(key: key);

  @override
  _PigPageState createState() => _PigPageState();
}

class _PigPageState extends State<PigPage> {
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PIG WEIGHT',
                  style: TextStyle(fontSize: 45.0, color: Colors.pinkAccent),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'CALCULATOR',
                  style: TextStyle(fontSize: 45.0, color: Colors.pinkAccent),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/pig.png',
                  width: 450.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 110,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text(
                                  'LENGTH\n(cm)',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                  textAlign: TextAlign.center,

                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: new InputDecoration.collapsed(
                                        hintText: 'Enter length'
                                    ),
                                    controller: _controller1,
                                  ),
                                ),
                              ],
                            ), //helperText: 'Helper text',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 300,
                              height: 110,
                              padding: const EdgeInsets.symmetric(vertical: 10.0),

                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    'GIRTH\n(cm)',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _controller2,
                                        textAlign: TextAlign.center,
                                      decoration: new InputDecoration.collapsed(
                                          hintText: 'Enter girth'
                                    ),

                                  ),
                                  ),
                                ],
                              ), //helperText: 'Helper text',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      var input01 = _controller1.text;
                      var input02 = _controller2.text;
                      var weight = 0.0;
                      var length = double.tryParse(input01);
                      var girth = double.tryParse(input02);
                      if (length == null || weight == null) {
                        print(
                            "กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น");
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('ERROR',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                content: Text('Invalid input'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'))
                                ],
                              );
                            });
                      } else {
                        double weight = (girth! / 100) *
                            (girth / 100) *
                            (length / 100) *
                            69.3;
                        double price = weight * 112.50;
                        double Tolerance_weight_max = (0.03 * weight) + weight;
                        double Tolerance_price_max = (0.03 * price) + price;
                        double Tolerance_weight_min = weight - (0.03 * weight);
                        double Tolerance_price_min = price - (0.03 * price);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/ic_pig.png',
                                        width: 30, height: 30),
                                    Text('  RESULT'),
                                  ],
                                ),
                              ),
                              content: Text(
                                  'Weight: ${Tolerance_weight_min.round()} - ${Tolerance_weight_max.round()} kg\nPrice: '
                                      '${Tolerance_price_min.round()} - ${Tolerance_price_max.round()} Baht'),
                              actions: [
                                // ปุ่ม OK ใน dialog
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
