class Banner {
  String image;
  String id;

  Banner({required this.image, required this.id});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(image: json['image'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'id': id};
  }
}

class ListBanner {
  List<Banner> listBanner = [];

  ListBanner({required this.listBanner});

  factory ListBanner.fromJson(List<dynamic> json) {
    List<Banner> listBanner = [];
    listBanner =
        json.map((e) => Banner(image: e['image'], id: e['id'])).toList();
    return ListBanner(listBanner: listBanner);
  }

  List<dynamic> toJson() {
    return listBanner.map((e) => e.toJson()).toList();
  }
}
