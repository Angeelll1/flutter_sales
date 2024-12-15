class History {
  String? docno;
  String? subdist_id;
  String? chiller_id;
  String? path_image;
  String? send_date;
  String? subdist_name;
  String? detections;

  History({
    this.chiller_id,
    this.docno,
    this.path_image,
    this.send_date,
    this.subdist_id,
    this.subdist_name,
    this.detections,
  });

  History.fromJson(Map<String, dynamic> json) {
    docno = json['docno'];
    subdist_id = json['subdist_id'];
    chiller_id = json['chiller_id'];
    path_image = json['path_image'];
    send_date = json['send_date'];
    subdist_name = json['subdist_name'];
    detections = json['detections'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docno'] = this.docno;
    data['subdist_id'] = this.subdist_id;
    data['chiller_id'] = this.chiller_id;
    data['path_image'] = this.path_image;
    data['send_date'] = this.send_date;
    data['subdist_name'] = this.subdist_name;
    data['detections'] = this.detections;

    return data;
  }
}
