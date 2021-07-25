class ModelHistoryPriceMarket {
  String date = '';
  double value = 0;

  ModelHistoryPriceMarket({required this.date, required this.value});

  ModelHistoryPriceMarket.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['value'] = this.value;
    return data;
  }
}