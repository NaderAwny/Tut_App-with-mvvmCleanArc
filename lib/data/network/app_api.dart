import 'package:dio/dio.dart';
import 'package:mvvmclean/app/constants.dart';
import 'package:mvvmclean/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;
  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/customers/forgetPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);
  @POST("/customers/register")
  Future<AuthenticationResponse> register(
    @Field("user_name") String userName,
    @Field("country_mobile_code") String countryMobileCode,
    @Field("mobile_number") String mobileNumber,
    @Field("email") String email,
    @Field("password") String password,
    @Field("profile_picture") String profilePicture,
  );
  @GET("/home")
  Future<HomeResponse> getHome();
  @GET("/stores/{id}")
  Future<HomeDetailsResponse> getHomeDetails(@Path("id") int id);
}
