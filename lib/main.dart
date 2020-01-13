import 'package:flutter/material.dart';
import 'package:todo/Modal.dart';
import 'package:todo/Todo.dart';
import 'package:todo/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ToDo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todos = <Todo>[];
  Modal modal = new Modal();
  String newTodo = '';

  @override
  void initState() {
    for (var i = 0; i <= 10; i++) {
      _todos.add(Todo(i, 'Todo item $i', false));
    }
    super.initState();
  }

  void _addTodo() {
    setState(() {
      _todos.insert(0, Todo(_todos.length, newTodo, false));
      newTodo = '';
    });
  }

  void _update(int index) {
    setState(() {
      _todos[index].todo = newTodo;
    });
  }

  void _onChange(String val) {
    setState(() {
      newTodo = val;
    });
  }

  Widget _row(Todo todo, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: RawMaterialButton(
                padding: const EdgeInsets.all(10),
                shape: CircleBorder(),
                child: Icon(
                  Icons.check,
                  color: todo.done ? Colors.green : Colors.grey[300],
                ),
                onPressed: () {
                  setState(() {
                    _todos[index].done = !todo.done;
                  });
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Text(
                todo.todo,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20.0,
                    decoration: todo.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var todoIn = _todos[index];
          return GestureDetector(
            onLongPress: () {
              modal.mainBottomSheet(context, 'Edit Todo', _onChange, () {
                _update(index);
              }, todoIn.todo);
            },
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  _todos.removeAt(index);
                });
              },
              key: Key(todoIn.todo),
              child: _row(todoIn, index),
            ),
          );
        },
        itemCount: _todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modal.mainBottomSheet(context, 'Add Todo', _onChange, _addTodo);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
