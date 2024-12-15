class MSubdist {
 String? subdist_id;
       String? subdist_name;
       String? location;
       String? owner_id;
       String? pic;

  MSubdist({
    this.subdist_id,
    this.subdist_name,
    this.location,
    this.owner_id,
    this.pic,
  });

  MSubdist.fromJson(Map<String, dynamic> json) {
    subdist_id = json['subdist_id'];
    subdist_name = json['subdist_name'];
    location = json['location'];
    owner_id = json['owner_id'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subdist_id'] = this.subdist_id;
    data['subdist_name'] = this.subdist_name;
    data['location'] = this.location;
    data['owner_id'] = this.owner_id;
    data['pic'] = this.pic;


    return data;
  }
}
