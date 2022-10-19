import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int counts = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Ism",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Familiya",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            counts++;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                            Text("Add User")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Save")),
                )
              ],
            ),
          );
        },
        itemCount: counts,
      ),
    );
  }
}
