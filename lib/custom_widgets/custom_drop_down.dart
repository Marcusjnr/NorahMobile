
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final IconData icon;
  final List<String> options;
  final String hint;

  CustomDropDown({
    @required this.icon,
    this.options,
    @required this.hint
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
            height: 60.0,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
            padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
            child: Theme(
              data: ThemeData(
                hintColor: Colors.transparent,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      icon,
                      color: Colors.black38,
                      size: 20.0,
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text(hint, style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'lgc',
                          letterSpacing: 0.3,
                          color: Colors.black38,
                          fontWeight: FontWeight.w600
                      ),),
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {

                      },
                    ),
                  ),
                ],
              ),
            ),
          )
    );
  }
}