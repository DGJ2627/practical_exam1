import 'package:flutter/cupertino.dart';

class ApiModel extends ChangeNotifier {

  int id;

  ApiModel({

    required this.id,
  });

  factory ApiModel.fromMap({required Map data}) {
    return ApiModel(
      id: data['id'],
    );
  }

}
