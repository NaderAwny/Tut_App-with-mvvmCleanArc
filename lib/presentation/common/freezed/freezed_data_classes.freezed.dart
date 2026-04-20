// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginObject {

 String get userName; String get password;
/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginObjectCopyWith<LoginObject> get copyWith => _$LoginObjectCopyWithImpl<LoginObject>(this as LoginObject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,userName,password);

@override
String toString() {
  return 'LoginObject(userName: $userName, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginObjectCopyWith<$Res>  {
  factory $LoginObjectCopyWith(LoginObject value, $Res Function(LoginObject) _then) = _$LoginObjectCopyWithImpl;
@useResult
$Res call({
 String userName, String password
});




}
/// @nodoc
class _$LoginObjectCopyWithImpl<$Res>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._self, this._then);

  final LoginObject _self;
  final $Res Function(LoginObject) _then;

/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? password = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginObject].
extension LoginObjectPatterns on LoginObject {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginObject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginObject value)  $default,){
final _that = this;
switch (_that) {
case _LoginObject():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginObject value)?  $default,){
final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that.userName,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginObject():
return $default(_that.userName,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that.userName,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _LoginObject implements LoginObject {
   _LoginObject(this.userName, this.password);
  

@override final  String userName;
@override final  String password;

/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginObjectCopyWith<_LoginObject> get copyWith => __$LoginObjectCopyWithImpl<_LoginObject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,userName,password);

@override
String toString() {
  return 'LoginObject(userName: $userName, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginObjectCopyWith<$Res> implements $LoginObjectCopyWith<$Res> {
  factory _$LoginObjectCopyWith(_LoginObject value, $Res Function(_LoginObject) _then) = __$LoginObjectCopyWithImpl;
@override @useResult
$Res call({
 String userName, String password
});




}
/// @nodoc
class __$LoginObjectCopyWithImpl<$Res>
    implements _$LoginObjectCopyWith<$Res> {
  __$LoginObjectCopyWithImpl(this._self, this._then);

  final _LoginObject _self;
  final $Res Function(_LoginObject) _then;

/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? password = null,}) {
  return _then(_LoginObject(
null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ForgetPasswordObject {

 String get email;
/// Create a copy of ForgetPasswordObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordObjectCopyWith<ForgetPasswordObject> get copyWith => _$ForgetPasswordObjectCopyWithImpl<ForgetPasswordObject>(this as ForgetPasswordObject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordObject&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgetPasswordObject(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordObjectCopyWith<$Res>  {
  factory $ForgetPasswordObjectCopyWith(ForgetPasswordObject value, $Res Function(ForgetPasswordObject) _then) = _$ForgetPasswordObjectCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgetPasswordObjectCopyWithImpl<$Res>
    implements $ForgetPasswordObjectCopyWith<$Res> {
  _$ForgetPasswordObjectCopyWithImpl(this._self, this._then);

  final ForgetPasswordObject _self;
  final $Res Function(ForgetPasswordObject) _then;

/// Create a copy of ForgetPasswordObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgetPasswordObject].
extension ForgetPasswordObjectPatterns on ForgetPasswordObject {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgetPasswordObject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgetPasswordObject() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgetPasswordObject value)  $default,){
final _that = this;
switch (_that) {
case _ForgetPasswordObject():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgetPasswordObject value)?  $default,){
final _that = this;
switch (_that) {
case _ForgetPasswordObject() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgetPasswordObject() when $default != null:
return $default(_that.email);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _ForgetPasswordObject():
return $default(_that.email);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _ForgetPasswordObject() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _ForgetPasswordObject implements ForgetPasswordObject {
   _ForgetPasswordObject(this.email);
  

@override final  String email;

/// Create a copy of ForgetPasswordObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgetPasswordObjectCopyWith<_ForgetPasswordObject> get copyWith => __$ForgetPasswordObjectCopyWithImpl<_ForgetPasswordObject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgetPasswordObject&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgetPasswordObject(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ForgetPasswordObjectCopyWith<$Res> implements $ForgetPasswordObjectCopyWith<$Res> {
  factory _$ForgetPasswordObjectCopyWith(_ForgetPasswordObject value, $Res Function(_ForgetPasswordObject) _then) = __$ForgetPasswordObjectCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ForgetPasswordObjectCopyWithImpl<$Res>
    implements _$ForgetPasswordObjectCopyWith<$Res> {
  __$ForgetPasswordObjectCopyWithImpl(this._self, this._then);

  final _ForgetPasswordObject _self;
  final $Res Function(_ForgetPasswordObject) _then;

/// Create a copy of ForgetPasswordObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ForgetPasswordObject(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RegisterObject {

 String get userName; String get countryMobileCode; String get mobileNumber; String get email; String get password; String get profilePicture;
/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterObjectCopyWith<RegisterObject> get copyWith => _$RegisterObjectCopyWithImpl<RegisterObject>(this as RegisterObject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.countryMobileCode, countryMobileCode) || other.countryMobileCode == countryMobileCode)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}


@override
int get hashCode => Object.hash(runtimeType,userName,countryMobileCode,mobileNumber,email,password,profilePicture);

@override
String toString() {
  return 'RegisterObject(userName: $userName, countryMobileCode: $countryMobileCode, mobileNumber: $mobileNumber, email: $email, password: $password, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class $RegisterObjectCopyWith<$Res>  {
  factory $RegisterObjectCopyWith(RegisterObject value, $Res Function(RegisterObject) _then) = _$RegisterObjectCopyWithImpl;
@useResult
$Res call({
 String userName, String countryMobileCode, String mobileNumber, String email, String password, String profilePicture
});




}
/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._self, this._then);

  final RegisterObject _self;
  final $Res Function(RegisterObject) _then;

/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? countryMobileCode = null,Object? mobileNumber = null,Object? email = null,Object? password = null,Object? profilePicture = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,countryMobileCode: null == countryMobileCode ? _self.countryMobileCode : countryMobileCode // ignore: cast_nullable_to_non_nullable
as String,mobileNumber: null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterObject].
extension RegisterObjectPatterns on RegisterObject {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterObject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterObject value)  $default,){
final _that = this;
switch (_that) {
case _RegisterObject():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterObject value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String countryMobileCode,  String mobileNumber,  String email,  String password,  String profilePicture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that.userName,_that.countryMobileCode,_that.mobileNumber,_that.email,_that.password,_that.profilePicture);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String countryMobileCode,  String mobileNumber,  String email,  String password,  String profilePicture)  $default,) {final _that = this;
switch (_that) {
case _RegisterObject():
return $default(_that.userName,_that.countryMobileCode,_that.mobileNumber,_that.email,_that.password,_that.profilePicture);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String countryMobileCode,  String mobileNumber,  String email,  String password,  String profilePicture)?  $default,) {final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that.userName,_that.countryMobileCode,_that.mobileNumber,_that.email,_that.password,_that.profilePicture);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterObject implements RegisterObject {
   _RegisterObject(this.userName, this.countryMobileCode, this.mobileNumber, this.email, this.password, this.profilePicture);
  

@override final  String userName;
@override final  String countryMobileCode;
@override final  String mobileNumber;
@override final  String email;
@override final  String password;
@override final  String profilePicture;

/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterObjectCopyWith<_RegisterObject> get copyWith => __$RegisterObjectCopyWithImpl<_RegisterObject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.countryMobileCode, countryMobileCode) || other.countryMobileCode == countryMobileCode)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}


@override
int get hashCode => Object.hash(runtimeType,userName,countryMobileCode,mobileNumber,email,password,profilePicture);

@override
String toString() {
  return 'RegisterObject(userName: $userName, countryMobileCode: $countryMobileCode, mobileNumber: $mobileNumber, email: $email, password: $password, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class _$RegisterObjectCopyWith<$Res> implements $RegisterObjectCopyWith<$Res> {
  factory _$RegisterObjectCopyWith(_RegisterObject value, $Res Function(_RegisterObject) _then) = __$RegisterObjectCopyWithImpl;
@override @useResult
$Res call({
 String userName, String countryMobileCode, String mobileNumber, String email, String password, String profilePicture
});




}
/// @nodoc
class __$RegisterObjectCopyWithImpl<$Res>
    implements _$RegisterObjectCopyWith<$Res> {
  __$RegisterObjectCopyWithImpl(this._self, this._then);

  final _RegisterObject _self;
  final $Res Function(_RegisterObject) _then;

/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? countryMobileCode = null,Object? mobileNumber = null,Object? email = null,Object? password = null,Object? profilePicture = null,}) {
  return _then(_RegisterObject(
null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,null == countryMobileCode ? _self.countryMobileCode : countryMobileCode // ignore: cast_nullable_to_non_nullable
as String,null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
