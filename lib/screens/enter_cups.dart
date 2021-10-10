import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'choose_device_screen.dart';
import 'results.dart';
import 'package:homebrew/utils/coffee_tools.dart';

class EnterCups extends StatefulWidget {
  final String tc;
  const EnterCups({Key key, this.tc}) : super(key: key);
  @override
  _EnterCupsState createState() => _EnterCupsState();
}

class _EnterCupsState extends State<EnterCups> {
  final value = TextEditingController();
  bool agreed = false;

  void toggle(bool value) {
    setState(() {
      agreed = !agreed;
    });
  }

  void checked() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text(''),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          key: Key('back-one'),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChooseDeviceScreen())),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text("How many cups would you like?",
                  key: Key('enter-cups-screen'),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff4C748B))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                key: Key('number-of-cups'),
                controller: value,
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff4C748B), width: 2.0),
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (String value) {
                  if (agreed == true && value != "0") {
                    ;
                  } else {
                    toggle(agreed);
                  }
                },
              ),
            ),
            ButtonTheme(
              minWidth: 250,
              height: 50,
              child: Padding(
                  padding: EdgeInsets.only(),
                  child: RaisedButton(
                      color: Color(0xff4C748B),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: Text("Continue",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Color(0xffffffff)),
                          key: Key('continue2')),
                      onPressed: agreed
                          ? () {
                              CoffeeTools coffe = CoffeeTools();
                              coffe.whatType(widget.tc);
                              coffe.WaterConverter(value.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Results(coffe)),
                              );
                            }
                          : null)),
            )
          ],
        ),
      ),
    );
  }
}
