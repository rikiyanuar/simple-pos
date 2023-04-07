// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'selected_food_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectedFoodEntity _$SelectedFoodEntityFromJson(Map<String, dynamic> json) {
  return _SelectedFoodEntity.fromJson(json);
}

/// @nodoc
class _$SelectedFoodEntityTearOff {
  const _$SelectedFoodEntityTearOff();

  _SelectedFoodEntity call(
      {int? id,
      String? name,
      String? picture,
      String? picture_ori,
      required int price,
      required int qty,
      required int subtotal}) {
    return _SelectedFoodEntity(
      id: id,
      name: name,
      picture: picture,
      picture_ori: picture_ori,
      price: price,
      qty: qty,
      subtotal: subtotal,
    );
  }

  SelectedFoodEntity fromJson(Map<String, Object?> json) {
    return SelectedFoodEntity.fromJson(json);
  }
}

/// @nodoc
const $SelectedFoodEntity = _$SelectedFoodEntityTearOff();

/// @nodoc
mixin _$SelectedFoodEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String? get picture_ori => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  int get subtotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedFoodEntityCopyWith<SelectedFoodEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedFoodEntityCopyWith<$Res> {
  factory $SelectedFoodEntityCopyWith(
          SelectedFoodEntity value, $Res Function(SelectedFoodEntity) then) =
      _$SelectedFoodEntityCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? picture,
      String? picture_ori,
      int price,
      int qty,
      int subtotal});
}

/// @nodoc
class _$SelectedFoodEntityCopyWithImpl<$Res>
    implements $SelectedFoodEntityCopyWith<$Res> {
  _$SelectedFoodEntityCopyWithImpl(this._value, this._then);

  final SelectedFoodEntity _value;
  // ignore: unused_field
  final $Res Function(SelectedFoodEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? picture = freezed,
    Object? picture_ori = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? subtotal = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      picture_ori: picture_ori == freezed
          ? _value.picture_ori
          : picture_ori // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: subtotal == freezed
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SelectedFoodEntityCopyWith<$Res>
    implements $SelectedFoodEntityCopyWith<$Res> {
  factory _$SelectedFoodEntityCopyWith(
          _SelectedFoodEntity value, $Res Function(_SelectedFoodEntity) then) =
      __$SelectedFoodEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? picture,
      String? picture_ori,
      int price,
      int qty,
      int subtotal});
}

/// @nodoc
class __$SelectedFoodEntityCopyWithImpl<$Res>
    extends _$SelectedFoodEntityCopyWithImpl<$Res>
    implements _$SelectedFoodEntityCopyWith<$Res> {
  __$SelectedFoodEntityCopyWithImpl(
      _SelectedFoodEntity _value, $Res Function(_SelectedFoodEntity) _then)
      : super(_value, (v) => _then(v as _SelectedFoodEntity));

  @override
  _SelectedFoodEntity get _value => super._value as _SelectedFoodEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? picture = freezed,
    Object? picture_ori = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? subtotal = freezed,
  }) {
    return _then(_SelectedFoodEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      picture_ori: picture_ori == freezed
          ? _value.picture_ori
          : picture_ori // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: subtotal == freezed
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelectedFoodEntity implements _SelectedFoodEntity {
  const _$_SelectedFoodEntity(
      {this.id,
      this.name,
      this.picture,
      this.picture_ori,
      required this.price,
      required this.qty,
      required this.subtotal});

  factory _$_SelectedFoodEntity.fromJson(Map<String, dynamic> json) =>
      _$$_SelectedFoodEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? picture;
  @override
  final String? picture_ori;
  @override
  final int price;
  @override
  final int qty;
  @override
  final int subtotal;

  @override
  String toString() {
    return 'SelectedFoodEntity(id: $id, name: $name, picture: $picture, picture_ori: $picture_ori, price: $price, qty: $qty, subtotal: $subtotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedFoodEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.picture_ori, picture_ori) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.subtotal, subtotal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(picture_ori),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(subtotal));

  @JsonKey(ignore: true)
  @override
  _$SelectedFoodEntityCopyWith<_SelectedFoodEntity> get copyWith =>
      __$SelectedFoodEntityCopyWithImpl<_SelectedFoodEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectedFoodEntityToJson(this);
  }
}

abstract class _SelectedFoodEntity implements SelectedFoodEntity {
  const factory _SelectedFoodEntity(
      {int? id,
      String? name,
      String? picture,
      String? picture_ori,
      required int price,
      required int qty,
      required int subtotal}) = _$_SelectedFoodEntity;

  factory _SelectedFoodEntity.fromJson(Map<String, dynamic> json) =
      _$_SelectedFoodEntity.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get picture;
  @override
  String? get picture_ori;
  @override
  int get price;
  @override
  int get qty;
  @override
  int get subtotal;
  @override
  @JsonKey(ignore: true)
  _$SelectedFoodEntityCopyWith<_SelectedFoodEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
