import 'package:mvvmclean/app/constants.dart';
import 'package:mvvmclean/app/extensions.dart';
import 'package:mvvmclean/data/responses/responses.dart';
import 'package:mvvmclean/domain/model/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero,
    );
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  ForgotPassword toDomain() {
    return ForgotPassword(this?.support.orEmpty() ?? Constants.empty);
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  ServicesAd toDomain() {
    return ServicesAd(
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension BannerResponseMapper on BannersResponse? {
  BannerAD toDomain() {
    return BannerAD(
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension StoreResponseMapper on StoresResponse? {
  Store toDomain() {
    return Store(
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

//Marge from HomeDataResponseMapper and HomeResponseMapper to make it more readable
extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<ServicesAd> services =
        (this?.data?.services?.map(
                  (serviceResponse) => serviceResponse.toDomain(),
                ) ??
                Iterable.empty())
            .cast<ServicesAd>()
            .toList();
    List<BannerAD> banners =
        (this?.data?.banners?.map(
                  (bannerResponse) => bannerResponse.toDomain(),
                ) ??
                Iterable.empty())
            .cast<BannerAD>()
            .toList();
    List<Store> stores =
        (this?.data?.stores?.map((storeResponse) => storeResponse.toDomain()) ??
                Iterable.empty())
            .cast<Store>()
            .toList();
    var data = HomeData(services, banners, stores);
    return HomeObject(data);
  }
}

// this is the old way to do it
// extension HomeDataResponseMapper on HomeDataResponse? {
//   HomeData toDomain() {
//     List<Services>services=(this?.services?.map((serviceResponse)=>serviceResponse.toDomain())?? Iterable.empty()).cast<Services>().toList();
//     List<BannerAD>banners=(this?.banners?.map((bannerResponse)=>bannerResponse.toDomain())?? Iterable.empty()).cast<BannerAD>().toList();
//     List<Store>stores=(this?.stores?.map((storeResponse)=>storeResponse.toDomain())?? Iterable.empty()).cast<Store>().toList();
//     return HomeData(services,banners,stores);
//   }
// }

// extension HomeResponseMapper on HomeResponse? {
//   HomeObject toDomain() {
//     return HomeObject(this?.data.toDomain());
//   }
// }

extension HomeDetailsResponseMapper on HomeDetailsResponse? {
  HomeDetailsObject toDomain() {
    return HomeDetailsObject(
      this?.image.orEmpty() ?? Constants.empty,
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.details.orEmpty() ?? Constants.empty,
      this?.services.orEmpty() ?? Constants.empty,
      this?.about.orEmpty() ?? Constants.empty,
    );
  }
}
