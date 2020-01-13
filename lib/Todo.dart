class Todo {
  String _todo;
  int _id;
  bool _done;

  Todo(this._id, this._todo, this._done);

  String get todo => _todo;
  int get id => _id;
  bool get done => _done;

  set done(bool doneVal) {
    this._done = doneVal;
  }

  set todo(String newTodo) {
    this._todo = newTodo;
  }
}
