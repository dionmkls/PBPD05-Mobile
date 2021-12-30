import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'PDP D-05',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Color(0xff5297ee),
        centerTitle: true,
        title: Text(
          "Frequently Asked Questions (FAQs)",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Positioned(
                top: 40,
                left: 10,
                right: 10,
                child: Image.asset('assets/images/faq.png')
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:Text(
                    "Punya pertanyaan terkait dengan COVID-19? Laman FAQ ini dirancang untuk menjawab pertanyaan-pertanyaan seputar pandemi COVID-19 dan vaksinasi.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    )
                )
            ),
            ElevatedButton(
              child: const Text("Read More"),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff5297ee), // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FaqPage()),
              );
            },
            )
          ]),
    );
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\n'),
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Masukkan Pertanyaan",
              labelText: "Pertanyaan",
              // labelStyle: TextStyle(color: Color(0xff5297ee)),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text('\n'),
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Masukkan Jawaban",
              labelText: "Jawaban",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child:
            Center (
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff5297ee), // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            )
          ),
        ],
      ),
    );
  }
}

class FaqPage extends StatelessWidget {
  // Generating some dummy data
  List<Map<String, dynamic>> _items = List.generate(
      20,
          (index) => {
        'id': index,
        'title': 'Pertanyaan $index',
        'description':
        'Ini adalah jawaban dari pertanyaan $index.',
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff5297ee),
          centerTitle: true,
          title: Text('Frequently Asked Questions (FAQs)',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Color(0xff5297ee),
                        centerTitle: true,
                        title: const Text('Form',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      body: const MyCustomForm(),
                      );
                  },
                ));
              },
            ),
          ],
        ),
        body:
        SingleChildScrollView(
          child: ExpansionPanelList.radio(
            elevation: 3,
            animationDuration: Duration(milliseconds: 600),
            children: _items
                .map(
                  (item) => ExpansionPanelRadio(
                value: item['id'],
                canTapOnHeader: true,
                headerBuilder: (_, isExpanded) => Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text(
                      item['title'],
                      style: TextStyle(fontSize: 20),
                    )),
                body: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(item['description']),
                ),
              ),
            )
                .toList(),
          ),
        )
    );
  }
}