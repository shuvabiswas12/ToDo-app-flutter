import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(ToDo());
}

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<String> todos = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ToDo app"),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      obscureText: false,
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: "Write Something...",
                      ),
                      onChanged: (values) => {},
                    ),
                    ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        todos.add(controller.text);

                        setState(() {
                          todos = todos;
                        });
                        controller.text = "";
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(todos[i]),
                      ElevatedButton(
                        child: Text("Delete"),
                        onPressed: () {
                          todos.removeAt(i);
                          setState(() {
                            todos = todos;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
