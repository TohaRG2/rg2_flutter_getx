class GetMoneyItem {

  int id;
  String title;
  String price;
  String help;
  bool isExpanded;

  GetMoneyItem({this.id, this.title, this.price, this.help, this.isExpanded = false});

  @override
  String toString() {
    return "GetMoneyItem: $id $title, $price, $isExpanded";
  }

}