import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/data/providers/ads_provider.dart';

class WebSocketRepository {
  static messageSent(roomId) => gql("""
   subscription messageSent {
   messageSent(roomId: "$roomId") {
    id: _id
    text
    ad {
      ...adFields
    }
    sender {
      ...userFields
    }
    createdAt
    updatedAt
   }
 }
 """ +
      AdsProvider.adFragment);

  static HttpLink httpLink = HttpLink('http://' + ApiBaseHelper.domain);

  static AuthLink authLink(token) =>
      AuthLink(getToken: () async => 'Bearer $token');

  static WebSocketLink get websocketLink => WebSocketLink(
        'ws://' + ApiBaseHelper.domain,
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: Duration(hours: 1),
          delayBetweenReconnectionAttempts: Duration(seconds: 1),
        ),
      );

  static ValueNotifier<GraphQLClient> get initailizeClient {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: websocketLink,
      ),
    );
    return client;
  }
}
