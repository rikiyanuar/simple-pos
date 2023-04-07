// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodEntity _$FoodEntityFromJson(Map<String, dynamic> json) {
  return _FoodEntity.fromJson(json);
}

/// @nodoc
class _$FoodEntityTearOff {
  const _$FoodEntityTearOff();

  _FoodEntity call(
      {String? food_code,
      String? name,
      String? price,
      String? picture,
      String? picture_ori,
      DateTime? created_at,
      int? id}) {
    return _FoodEntity(
      food_code: food_code,
      name: name,
      price: price,
      picture: picture,
      picture_ori: picture_ori,
      created_at: created_at,
      id: id,
    );
  }

  FoodEntity fromJson(Map<String, Object?> json) {
    return FoodEntity.fromJson(json);
  }
}

/// @nodoc
const $FoodEntity = _$FoodEntityTearOff();

/// @nodoc
mixin _$FoodEntity {
  String? get food_code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String? get picture_ori => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodEntityCopyWith<FoodEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntityCopyWith<$Res> {
  factory $FoodEntityCopyWith(
          FoodEntity value, $Res Function(FoodEntity) then) =
      _$FoodEntityCopyWithImpl<$Res>;
  $Res call(
      {String? food_code,
      String? name,
      String? price,
      String? picture,
      String? picture_ori,
      DateTime? created_at,
      int? id});
}

/// @nodoc
class _$FoodEntityCopyWithImpl<$Res> implements $FoodEntityCopyWith<$Res> {
  _$FoodEntityCopyWithImpl(this._value, this._then);

  final FoodEntity _value;
  // ignore: unused_field
  final $Res Function(FoodEntity) _then;

  @override
  $Res call({
    Object? food_code = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? picture = freezed,
    Object? picture_ori = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      food_code: food_code == freezed
          ? _value.food_code
          : food_code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      picture_ori: picture_ori == freezed
          ? _value.picture_ori
          : picture_ori // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$FoodEntityCopyWith<$Res> implements $FoodEntityCopyWith<$Res> {
  factory _$FoodEntityCopyWith(
          _FoodEntity value, $Res Function(_FoodEntity) then) =
      __$FoodEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? food_code,
      String? name,
      String? price,
      String? picture,
      String? picture_ori,
      DateTime? created_at,
      int? id});
}

/// @nodoc
class __$FoodEntityCopyWithImpl<$Res> extends _$FoodEntityCopyWithImpl<$Res>
    implements _$FoodEntityCopyWith<$Res> {
  __$FoodEntityCopyWithImpl(
      _FoodEntity _value, $Res Function(_FoodEntity) _then)
      : super(_value, (v) => _then(v as _FoodEntity));

  @override
  _FoodEntity get _value => super._value as _FoodEntity;

  @override
  $Res call({
    Object? food_code = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? picture = freezed,
    Object? picture_ori = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
  }) {
    return _then(_FoodEntity(
      food_code: food_code == freezed
          ? _value.food_code
          : food_code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      picture_ori: picture_ori == freezed
          ? _value.picture_ori
          : picture_ori // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodEntity implements _FoodEntity {
  const _$_FoodEntity(
      {this.food_code,
      this.name,
      this.price,
      this.picture,
      this.picture_ori,
      this.created_at,
      this.id});

  factory _$_FoodEntity.fromJson(Map<String, dynamic> json) =>
      _$$_FoodEntityFromJson(json);

  @override
  final String? food_code;
  @override
  final String? name;
  @override
  final String? price;
  @override
  final String? picture;
  @override
  final String? picture_ori;
  @override
  final DateTime? created_at;
  @override
  final int? id;

  @override
  String toString() {
    return 'FoodEntity(food_code: $food_code, name: $name, price: $price, picture: $picture, picture_ori: $picture_ori, created_at: $created_at, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodEntity &&
            const DeepCollectionEquality().equals(other.food_code, food_code) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.picture_ori, picture_ori) &&
            const DeepCollectionEquality()
                .equals(other.created_at, created_at) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(food_code),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(picture_ori),
      const DeepCollectionEquality().hash(created_at),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$FoodEntityCopyWith<_FoodEntity> get copyWith =>
      __$FoodEntityCopyWithImpl<_FoodEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodEntityToJson(this);
  }
}

abstract class _FoodEntity implements FoodEntity {
  const factory _FoodEntity(
      {String? food_code,
      String? name,
      String? price,
      String? picture,
      String? picture_ori,
      DateTime? created_at,
      int? id}) = _$_FoodEntity;

  factory _FoodEntity.fromJson(Map<String, dynamic> json) =
      _$_FoodEntity.fromJson;

  @override
  String? get food_code;
  @override
  String? get name;
  @override
  String? get price;
  @override
  String? get picture;
  @override
  String? get picture_ori;
  @override
  DateTime? get created_at;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$FoodEntityCopyWith<_FoodEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
