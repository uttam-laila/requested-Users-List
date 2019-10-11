import 'dart:async';
// import 'dart:io';

import 'package:assigment01/models/userList.dart';

class ApprovedListBloc {
  List<UserList> approvedList = [];

  final _approvedListStreamController = StreamController<List<UserList>>();

  final _addToApprovedListStreamController = StreamController<UserList>();
  final _removeFromApprovedListStreamController = StreamController<UserList>();

  Stream<List<UserList>> get approvedListOfUsers => _approvedListStreamController.stream;
  // StreamSink<List<UserList>> get appprovedListOfUsersSink => _addToApprovedListStreamController.sink;



  void dispose(){
    _approvedListStreamController.close();
    _addToApprovedListStreamController.close();
    _removeFromApprovedListStreamController.close();
  }
}