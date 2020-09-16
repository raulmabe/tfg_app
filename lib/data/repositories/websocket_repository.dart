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

  static WebSocketLink websocketLink(token) => WebSocketLink(
        'ws://' + ApiBaseHelper.domain,
        config: SocketClientConfig(
            autoReconnect: true,
            inactivityTimeout: Duration(hours: 1),
            delayBetweenReconnectionAttempts: Duration(seconds: 1),
            initialPayload: {"Authorization": "Bearer $token"}),
      );

  static GraphQLClient client(token) => GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: websocketLink(token),
      );
}
