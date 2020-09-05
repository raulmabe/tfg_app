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

  static AuthLink authLink(token) => AuthLink(getToken: () => token);

  static WebSocketLink websocketLink(token) => WebSocketLink(
        url: 'ws://' + ApiBaseHelper.domain,
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: null,
          delayBetweenReconnectionAttempts: Duration(seconds: 1),
          initPayload: () => {
            'headers': {'Authorization': 'Token $token'},
          },
        ),
      );
  static Link link(token) => authLink(token).concat(websocketLink(token));

  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: link(token),
      ),
    );
    return client;
  }
}
