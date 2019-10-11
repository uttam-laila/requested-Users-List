class UserList {
  int _index;
  String _name;
  String _model;
  String _fromDate;
  String _toDate;
  String _picture;

  UserList(this._index, this._name, this._model, this._fromDate, this._toDate,
      this._picture);

  set index(int index) {
    this._index = index;
  }

  set name(String name) {
    this._name = name;
  }

  set model(String model) {
    this._model = model;
  }

  set fromDate(String fromDate) {
    this._fromDate = fromDate;
  }

  set toDate(String toDate) {
    this._toDate = toDate;
  }

  set picture(String picture) {
    this._picture = picture;
  }

  int get index => this._index;
  String get name => this._name;
  String get model => this._model;
  String get fromDate => this._fromDate;
  String get toDate => this._toDate;
  String get picture => this._picture;
}
