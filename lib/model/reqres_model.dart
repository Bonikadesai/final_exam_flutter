class RequresModel {
  List data;

  RequresModel({required this.data});

  factory RequresModel.fromMap({required Map data}) {
    return RequresModel(data: data['data']);
  }
}
