import 'package:flutter/material.dart';
import 'package:homebrew/utils/coffee_tools.dart';
import 'enter_cups.dart';
import 'choose_device_screen.dart';

class Results extends StatelessWidget {
  CoffeeTools coffe;
  Results(this.coffe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text(''),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          key: Key('back-two'),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EnterCups(
                        tc: coffe.whatCoffe,
                      ))),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 100,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFE5E5E5),
                border: Border.all(
                  color: Color(0xff4C748B),
                  width: 2,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text("Recommended",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'Kollektif',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff4C748B))),
                  ),
                  Text(
                    "${coffe.amountCoffee.round()}g - ${coffe.whatCoffe}",
                    key: Key('amount-and-type-coffee'),
                    style: TextStyle(
                        fontFamily: 'Kollektif',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff4C748B)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text("${coffe.gramsOfWater.round()}g - water",
                          key: Key('amount-water'),
                          style: TextStyle(
                              fontFamily: 'Kollektif',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff4C748B)))),
                  Text("Enjoy your delicious coffee",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          color: Color(0xff4C748B))),
                ],
              ),
            ),
            ButtonTheme(
                minWidth: 250,
                height: 50,
                child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Color(0xff4C748B),
                      child: Text(' Done ',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Color(0xffffffff))),
                      key: Key('done'),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseDeviceScreen())),
                    )))
          ],
        ),
      ),
    );
  }
}
