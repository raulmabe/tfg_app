import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/data/providers/ads_provider.dart';

class WebSocketRepository {
  static String messageSent(roomId) =>
      """
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
      AdsProvider.adFragment;

  static WebSocketLink websocketLink(token) => WebSocketLink(
        url: 'ws://' + ApiBaseHelper.domain,
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: Duration(hours: 1),
          delayBetweenReconnectionAttempts: Duration(seconds: 1),
          initPayload: () => {
            'headers': {'Authorization': 'Token $token'},
          },
        ),
      );

  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: websocketLink(token),
      ),
    );
    return client;
  }
}
