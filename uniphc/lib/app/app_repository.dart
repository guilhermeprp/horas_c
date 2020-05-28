import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppRepository extends Disposable {
  final HasuraConnect connection;
  AppRepository(this.connection);


  
  //dispose will be called automatically
  @override
  void dispose() {}
}
