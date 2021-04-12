class GetMoneyItem {

  String title;
  String price;
  String help;
  bool isExpanded;

  GetMoneyItem({this.title, this.price, this.help, this.isExpanded = false});

  @override
  String toString() {
    return "title: $title, $price, $isExpanded";
  }

}