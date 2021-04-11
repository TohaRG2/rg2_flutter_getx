class GetMoneyItem {

  String title;
  String price;
  String help;

  GetMoneyItem({this.title, this.price, this.help});

  @override
  String toString() {
    return "title: $title, $price";
  }

}