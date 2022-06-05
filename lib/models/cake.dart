class Cake{
  String? image;
  int? clickCount;
  int? priceCount;
  Cake({
    required this.image,
    required this.clickCount,
    required this.priceCount
  });
  factory Cake.fromJson(Map<String, dynamic> json) {
    return Cake(
      image: json['image'],
      clickCount: int.tryParse(json['clickCount']),
      priceCount: int.tryParse(json['priceCount']),
    );
  }

    Map<String, dynamic> toJson() => 
  {
    'image': image,
    'clickCount': clickCount,
    'priceCount': priceCount,
  };
   
}