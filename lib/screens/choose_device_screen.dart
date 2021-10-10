import 'package:flutter/material.dart';
import 'package:homebrew/utils/coffee_tools.dart';
import 'enter_cups.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  @override
  bool agreed = false;
  bool value;

  void toggle(bool value) {
    setState(() {
      agreed = !agreed;
    });
  }

  void checked() {
    setState(() {});
  }

  void dm() {
    value = false;
  }

  void fp() {
    value = true;
  }

  Widget build(BuildContext context) {
    CoffeeTools coffe;
    String x;
    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text("What Coffee maker are you using?",
                      key: Key('choose-screen'),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff4C748B)))),
              OutlineButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                borderSide: BorderSide(width: 2, color: Color(0xff4C748B)),
                onPressed: () {
                  value = true;
                  toggle(agreed);
                  fp();
                },
                child: Text(' Fench Press ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: Color(0xff4C748B))),
                key: Key('french-press'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(width: 2, color: Color(0xff4C748B)),
                  onPressed: () {
                    value = false;
                    toggle(agreed);
                    dm();
                  },
                  child: Text(
                    ' Drip Machine ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: Color(0xff4C748B)),
                  ),
                  key: Key('drip-machine'),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(),
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Color(0xff4C748B),
                    child: Text("Continue",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Color(0xffffffff)),
                        key: Key('continue1')),
                    onPressed: agreed
                        ? () {
                            if (value == true) {
                              x = "FP";
                            } else {
                              x = "DM";
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EnterCups(tc: x)));
                          }
                        : null,
                  )),
            ])));
  }
}
