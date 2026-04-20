class SliderObject {
  final String title;
  final String subTitle;
  final String image;
  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}

class ForgotPassword {
  String support;

  ForgotPassword(this.support);
}

class ServicesAd {
  int id;
  String title;
  String image;
  ServicesAd(this.id, this.title, this.image);
}

class BannerAD {
  int id;
  String link;
  String title;
  String image;
  BannerAD(this.id, this.link, this.title, this.image);
}

class Store {
  int id;
  String title;
  String image;
  Store(this.id, this.title, this.image);
}

class HomeData {
  List<ServicesAd> services;
  List<BannerAD> banners;
  List<Store> stores;
  HomeData(this.services, this.banners, this.stores);
}

class HomeObject {
  HomeData data;
  HomeObject(this.data);
}

class HomeDetailsObject {
  String image;
  int id;
  String title;
  String details;
  String services;
  String about;
  HomeDetailsObject(
    this.image,
    this.id,
    this.title,
    this.details,
    this.services,
    this.about,
  );
}
