// Define a Custom Form Widget
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  FocusNode myFocusNode;

  _printLatestValue() {
    print("Text field: ${myController.text}");
  }


  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed
    myFocusNode.dispose();
    myController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
              focusNode: myFocusNode,
//              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: false,
                contentPadding: EdgeInsets.all(18),
                labelText: "Password",
                hintText: "Type your password...",
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              ),

              controller: myController,

              obscureText: true,
              // The validator receives the text the user has typed in
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(myController.text)));
                }
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
            OutlineButton(
                color: Colors.blue,
                borderSide: BorderSide(color: Colors.blue),
                onPressed: () {
                  FocusScope.of(context).requestFocus(myFocusNode);
                },
                child: Text("Focus Text field", style: TextStyle(color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}
