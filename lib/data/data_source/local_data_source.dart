// import 'package:mvvmclean/data/network/error_handler.dart';
// import 'package:mvvmclean/data/responses/responses.dart';

// const CACHE_KEY_HOME = "CACHE_KEY_HOME";
// const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millis
// const CACHE_KEY_STORE_DETAILS = "CACHE_KEY_STORE_DETAILS";
// const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 1 minute cache in millis

// abstract class LocalDataSource {
//   Future<HomeResponse> getHomeData();
//   Future<void> saveHomeData(HomeResponse homeResponse);

//   Future<HomeDetailsResponse> getStoreDetails(int storeId);
//   Future<void> saveStoreDetails(
//     HomeDetailsResponse storeDetailsResponse,
//     int storeId,
//   );
//   void clearCache();
//   void removeCache(String key);
// }

// class LocalDataSourceImpl implements LocalDataSource {
//   // ignore: prefer_collection_literals
//   Map<String, CacheItem> cachedHomeData = Map();
//   // ignore: prefer_collection_literals
//   Map<String, CacheItem> cachedStoreDetailsData = Map();
//   @override
//   Future<HomeResponse> getHomeData() async {
//     CacheItem? cacheItem = cachedHomeData[CACHE_KEY_HOME];
//     if (cacheItem != null && cacheItem.isValide(CACHE_HOME_INTERVAL)) {
//       // return the response from cach
//       return cacheItem.data;
//     } else {
//       // return an error that cache is not there or its not valid
//       return throw ErrorHandler.handle(DataSource.CACHE_ERROR);
//     }
//   }

//   @override
//   Future<void> saveHomeData(HomeResponse homeResponse) async {
//     cachedHomeData[CACHE_KEY_HOME] = CacheItem(homeResponse);
//   }

//   // ignore: unused_element
//   @override
//   void clearCache() {
//     cachedHomeData.clear();
//   }

//   // ignore: unused_element
//   @override
//   void removeCache(String key) {
//     cachedHomeData.remove(key);
//   }

//   @override
//   Future<HomeDetailsResponse> getStoreDetails(int storeId) async {
//     CacheItem? cacheItem =
//         cachedStoreDetailsData["$CACHE_KEY_STORE_DETAILS-$storeId"];

//     if (cacheItem != null && cacheItem.isValide(CACHE_STORE_DETAILS_INTERVAL)) {
//       // return the response from cach
//       return cacheItem.data;
//     } else {
//       // return an error that cache is not there or its not valid
//       return throw ErrorHandler.handle(DataSource.CACHE_ERROR);
//     }
//   }

//   @override
//   Future<void> saveStoreDetails(
//     HomeDetailsResponse storeDetailsResponse,
//     int storeId,
//   ) async {
//     cachedStoreDetailsData["$CACHE_KEY_STORE_DETAILS-$storeId"] = CacheItem(
//       storeDetailsResponse,
//     );
//   }
// }

// class CacheItem {
//   dynamic data;
//   int cacheTime = DateTime.now().millisecondsSinceEpoch;
//   CacheItem(this.data);
// }

// extension CacheItemExtension on CacheItem {
//   bool isValide(int expirationTimeInMillis) {
//     int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
//     bool isvalid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
//     // expirationTimeInMillis -> 60 sec
//     // currentTimeInMillis -> 1:00:00
//     // cacheTime -> 12:59:30
//     // valid -> till 1:00:30
//     return isvalid;
//   }
// }

import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:mvvmclean/data/responses/responses.dart';

abstract class LocalDataSource {
  Future<HomeResponse?> getHomeData();
  Future<void> saveHomeData(HomeResponse data);

  Future<HomeDetailsResponse?> getStoreDetails(int storeId);
  Future<void> saveStoreDetails(HomeDetailsResponse data, int storeId);

  void clearCache();
  void removeCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  final Box<dynamic> box;
  LocalDataSourceImpl(this.box);

  static const homeKey = "home_data";
  static const hometime = "home_data_time";
  static const maxCacheAge = Duration(minutes: 2);
  String storeKey(int id) => "store_details_$id";
  String storetimeKey(int id) => "store_details_timestamp_$id";

  @override
  Future<HomeResponse?> getHomeData() async {
    final jsonstr = box.get(homeKey);
    if (jsonstr == null) return null;
    final timestamp = box.get(hometime);
    if (timestamp != null) {
      final cacheAt = DateTime.parse(timestamp);
      if (DateTime.now().difference(cacheAt) > maxCacheAge) {
        return null;
      }
    }
    return HomeResponse.fromJson(json.decode(jsonstr!) as Map<String, dynamic>);
  }

  @override
  Future<void> saveHomeData(HomeResponse data) async {
    await box.put(homeKey, json.encode(data.toJson()));
    await box.put(hometime, DateTime.now().toIso8601String());
  }

  @override
  Future<HomeDetailsResponse?> getStoreDetails(int storeId) async {
    final jsonstr = box.get(storeKey(storeId));
    if (jsonstr == null) return null;
    final timestamp = box.get(storetimeKey(storeId));
    if (timestamp != null) {
      final cacheAt = DateTime.parse(timestamp);
      if (DateTime.now().difference(cacheAt) > maxCacheAge) {
        return null;
      }
    }
    return HomeDetailsResponse.fromJson(
      json.decode(jsonstr!) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveStoreDetails(HomeDetailsResponse data, int storeId) async {
    await box.put(storeKey(storeId), json.encode(data.toJson()));
    await box.put(storetimeKey(storeId), DateTime.now().toIso8601String());
  }

  @override
  void clearCache() {
    box.clear();
  }

  @override
  void removeCache(String key) {
    box.delete(key);
  }
}
