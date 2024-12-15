class MChiller {
 String? chiller_id;
       String? outlet_id;

  MChiller({
    this.chiller_id,
    this.outlet_id,
  });

  MChiller.fromJson(Map<String, dynamic> json) {
    chiller_id = json['chiller_id'];
    outlet_id = json['outlet_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chiller_id'] = this.chiller_id;
    data['outlet_id'] = this.outlet_id;

    return data;
  }
}
