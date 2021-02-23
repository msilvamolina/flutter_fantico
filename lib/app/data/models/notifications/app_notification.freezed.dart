// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AppNotificationTearOff {
  const _$AppNotificationTearOff();

// ignore: unused_element
  _AppNotification call(
      {@required String id,
      @required String titulo,
      String mensaje,
      bool leida,
      String tipo,
      DateTime createdDate}) {
    return _AppNotification(
      id: id,
      titulo: titulo,
      mensaje: mensaje,
      leida: leida,
      tipo: tipo,
      createdDate: createdDate,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AppNotification = _$AppNotificationTearOff();

/// @nodoc
mixin _$AppNotification {
  String get id;
  String get titulo;
  String get mensaje;
  bool get leida;
  String get tipo;
  DateTime get createdDate;

  $AppNotificationCopyWith<AppNotification> get copyWith;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
          AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String titulo,
      String mensaje,
      bool leida,
      String tipo,
      DateTime createdDate});
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  final AppNotification _value;
  // ignore: unused_field
  final $Res Function(AppNotification) _then;

  @override
  $Res call({
    Object id = freezed,
    Object titulo = freezed,
    Object mensaje = freezed,
    Object leida = freezed,
    Object tipo = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      titulo: titulo == freezed ? _value.titulo : titulo as String,
      mensaje: mensaje == freezed ? _value.mensaje : mensaje as String,
      leida: leida == freezed ? _value.leida : leida as bool,
      tipo: tipo == freezed ? _value.tipo : tipo as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$AppNotificationCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(
          _AppNotification value, $Res Function(_AppNotification) then) =
      __$AppNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String titulo,
      String mensaje,
      bool leida,
      String tipo,
      DateTime createdDate});
}

/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(
      _AppNotification _value, $Res Function(_AppNotification) _then)
      : super(_value, (v) => _then(v as _AppNotification));

  @override
  _AppNotification get _value => super._value as _AppNotification;

  @override
  $Res call({
    Object id = freezed,
    Object titulo = freezed,
    Object mensaje = freezed,
    Object leida = freezed,
    Object tipo = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_AppNotification(
      id: id == freezed ? _value.id : id as String,
      titulo: titulo == freezed ? _value.titulo : titulo as String,
      mensaje: mensaje == freezed ? _value.mensaje : mensaje as String,
      leida: leida == freezed ? _value.leida : leida as bool,
      tipo: tipo == freezed ? _value.tipo : tipo as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

/// @nodoc
class _$_AppNotification extends _AppNotification {
  const _$_AppNotification(
      {@required this.id,
      @required this.titulo,
      this.mensaje,
      this.leida,
      this.tipo,
      this.createdDate})
      : assert(id != null),
        assert(titulo != null),
        super._();

  @override
  final String id;
  @override
  final String titulo;
  @override
  final String mensaje;
  @override
  final bool leida;
  @override
  final String tipo;
  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'AppNotification(id: $id, titulo: $titulo, mensaje: $mensaje, leida: $leida, tipo: $tipo, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppNotification &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.titulo, titulo) ||
                const DeepCollectionEquality().equals(other.titulo, titulo)) &&
            (identical(other.mensaje, mensaje) ||
                const DeepCollectionEquality()
                    .equals(other.mensaje, mensaje)) &&
            (identical(other.leida, leida) ||
                const DeepCollectionEquality().equals(other.leida, leida)) &&
            (identical(other.tipo, tipo) ||
                const DeepCollectionEquality().equals(other.tipo, tipo)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(titulo) ^
      const DeepCollectionEquality().hash(mensaje) ^
      const DeepCollectionEquality().hash(leida) ^
      const DeepCollectionEquality().hash(tipo) ^
      const DeepCollectionEquality().hash(createdDate);

  @override
  _$AppNotificationCopyWith<_AppNotification> get copyWith =>
      __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);
}

abstract class _AppNotification extends AppNotification {
  const _AppNotification._() : super._();
  const factory _AppNotification(
      {@required String id,
      @required String titulo,
      String mensaje,
      bool leida,
      String tipo,
      DateTime createdDate}) = _$_AppNotification;

  @override
  String get id;
  @override
  String get titulo;
  @override
  String get mensaje;
  @override
  bool get leida;
  @override
  String get tipo;
  @override
  DateTime get createdDate;
  @override
  _$AppNotificationCopyWith<_AppNotification> get copyWith;
}
