import 'package:flutter/material.dart';

class CreateParcelProvider extends ChangeNotifier {
  // Origin/Destination
  String _originCountry = 'China';
  String _originCountryCode = 'CN';
  String _originZipCode = '';
  String _destinationCountry = 'United States';
  String _destinationCountryCode = 'US';

  // Package dimensions
  double _weight = 0.0;
  double _length = 0.0;
  double _width = 0.0;
  double _height = 0.0;

  // Insurance
  double _declaredValue = 0.0;

  // Delivery option
  int _selectedDeliveryOption = 0;
  double _deliveryCost = 14.50;
  String _deliveryTime = '1-4 days';

  // Sender information
  String _senderFirstName = '';
  String _senderLastName = '';
  String _senderEmail = '';
  String _senderPhone = '';
  String _senderAddress = '';
  String _senderCity = '';
  String _senderState = '';
  String _senderZipCode = '';

  // Receiver information
  String _receiverFirstName = '';
  String _receiverLastName = '';
  String _receiverEmail = '';
  String _receiverPhone = '';
  String _receiverAddress = '';
  String _receiverCity = '';
  String _receiverState = '';
  String _receiverZipCode = '';

  // Promo code
  String _promoCode = '';

  // Getters
  String get originCountry => _originCountry;
  String get originCountryCode => _originCountryCode;
  String get originZipCode => _originZipCode;
  String get destinationCountry => _destinationCountry;
  String get destinationCountryCode => _destinationCountryCode;

  double get weight => _weight;
  double get length => _length;
  double get width => _width;
  double get height => _height;
  double get volume => (_length * _width * _height) / 1000000; // Convert to m³

  double get declaredValue => _declaredValue;

  int get selectedDeliveryOption => _selectedDeliveryOption;
  double get deliveryCost => _deliveryCost;
  String get deliveryTime => _deliveryTime;

  String get senderFirstName => _senderFirstName;
  String get senderLastName => _senderLastName;
  String get senderFullName => '$_senderFirstName $_senderLastName'.trim();
  String get senderEmail => _senderEmail;
  String get senderPhone => _senderPhone;
  String get senderAddress => _senderAddress;
  String get senderCity => _senderCity;
  String get senderState => _senderState;
  String get senderZipCode => _senderZipCode;
  String get senderFullAddress =>
      '$_senderCity, $_senderAddress, $_senderState, $_originCountry'.trim();

  String get receiverFirstName => _receiverFirstName;
  String get receiverLastName => _receiverLastName;
  String get receiverFullName => '$_receiverFirstName $_receiverLastName'.trim();
  String get receiverEmail => _receiverEmail;
  String get receiverPhone => _receiverPhone;
  String get receiverAddress => _receiverAddress;
  String get receiverCity => _receiverCity;
  String get receiverState => _receiverState;
  String get receiverZipCode => _receiverZipCode;
  String get receiverFullAddress =>
      '$_receiverCity, $_receiverAddress, $_receiverState, $_destinationCountry'.trim();

  String get promoCode => _promoCode;

  String get originPoint =>
      '$_originCountry, $_originZipCode, $_senderCity'.trim();
  String get destinationPoint =>
      '$_destinationCountry, $_receiverZipCode, $_receiverCity'.trim();

  String get dimensionsString => '${_length.toStringAsFixed(0)} x ${_width.toStringAsFixed(0)} x ${_height.toStringAsFixed(0)} in';

  // Setters
  void setOriginCountry(String country, String code) {
    _originCountry = country;
    _originCountryCode = code;
    notifyListeners();
  }

  void setOriginZipCode(String zipCode) {
    _originZipCode = zipCode;
    notifyListeners();
  }

  void setDestinationCountry(String country, String code) {
    _destinationCountry = country;
    _destinationCountryCode = code;
    notifyListeners();
  }

  void setWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void setLength(double length) {
    _length = length;
    notifyListeners();
  }

  void setWidth(double width) {
    _width = width;
    notifyListeners();
  }

  void setHeight(double height) {
    _height = height;
    notifyListeners();
  }

  void setDeclaredValue(double value) {
    _declaredValue = value;
    notifyListeners();
  }

  void setSelectedDeliveryOption(int option) {
    _selectedDeliveryOption = option;
    notifyListeners();
  }

  void setDeliveryCost(double cost) {
    _deliveryCost = cost;
    notifyListeners();
  }

  void setDeliveryTime(String time) {
    _deliveryTime = time;
    notifyListeners();
  }

  void setSenderFirstName(String firstName) {
    _senderFirstName = firstName;
    notifyListeners();
  }

  void setSenderLastName(String lastName) {
    _senderLastName = lastName;
    notifyListeners();
  }

  void setSenderEmail(String email) {
    _senderEmail = email;
    notifyListeners();
  }

  void setSenderPhone(String phone) {
    _senderPhone = phone;
    notifyListeners();
  }

  void setSenderAddress(String address) {
    _senderAddress = address;
    notifyListeners();
  }

  void setSenderCity(String city) {
    _senderCity = city;
    notifyListeners();
  }

  void setSenderState(String state) {
    _senderState = state;
    notifyListeners();
  }

  void setSenderZipCode(String zipCode) {
    _senderZipCode = zipCode;
    notifyListeners();
  }

  void setReceiverFirstName(String firstName) {
    _receiverFirstName = firstName;
    notifyListeners();
  }

  void setReceiverLastName(String lastName) {
    _receiverLastName = lastName;
    notifyListeners();
  }

  void setReceiverEmail(String email) {
    _receiverEmail = email;
    notifyListeners();
  }

  void setReceiverPhone(String phone) {
    _receiverPhone = phone;
    notifyListeners();
  }

  void setReceiverAddress(String address) {
    _receiverAddress = address;
    notifyListeners();
  }

  void setReceiverCity(String city) {
    _receiverCity = city;
    notifyListeners();
  }

  void setReceiverState(String state) {
    _receiverState = state;
    notifyListeners();
  }

  void setReceiverZipCode(String zipCode) {
    _receiverZipCode = zipCode;
    notifyListeners();
  }

  void setPromoCode(String code) {
    _promoCode = code;
    notifyListeners();
  }

  // Reset form
  void reset() {
    _originCountry = 'China';
    _originCountryCode = 'CN';
    _originZipCode = '';
    _destinationCountry = 'United States';
    _destinationCountryCode = 'US';
    _weight = 0.0;
    _length = 0.0;
    _width = 0.0;
    _height = 0.0;
    _declaredValue = 0.0;
    _selectedDeliveryOption = 0;
    _deliveryCost = 14.50;
    _deliveryTime = '1-4 days';
    _senderFirstName = '';
    _senderLastName = '';
    _senderEmail = '';
    _senderPhone = '';
    _senderAddress = '';
    _senderCity = '';
    _senderState = '';
    _senderZipCode = '';
    _receiverFirstName = '';
    _receiverLastName = '';
    _receiverEmail = '';
    _receiverPhone = '';
    _receiverAddress = '';
    _receiverCity = '';
    _receiverState = '';
    _receiverZipCode = '';
    _promoCode = '';
    notifyListeners();
  }
}
