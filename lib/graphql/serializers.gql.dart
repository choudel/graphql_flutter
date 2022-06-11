import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:graphql_flutter/graphql/create_user.data.gql.dart'
    show GCreateUserData;
import 'package:graphql_flutter/graphql/create_user.req.gql.dart'
    show GCreateUserReq;
import 'package:graphql_flutter/graphql/create_user.var.gql.dart'
    show GCreateUserVars;
import 'package:graphql_flutter/graphql/schema.schema.gql.dart'
    show
        GCommunityInput,
        GCreatuserInput,
        GDate,
        GLoginUserInput,
        GLong,
        GPartialUpdateCommunityInput,
        GPartialUpdateUserInput,
        GTime,
        GUserInput;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GCommunityInput,
  GCreateUserData,
  GCreateUserReq,
  GCreateUserVars,
  GCreatuserInput,
  GDate,
  GLoginUserInput,
  GLong,
  GPartialUpdateCommunityInput,
  GPartialUpdateUserInput,
  GTime,
  GUserInput
])
final Serializers serializers = _serializersBuilder.build();
