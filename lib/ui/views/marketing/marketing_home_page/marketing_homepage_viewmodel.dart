import 'package:fluttertoast/fluttertoast.dart';
import 'package:mycustomers/app/locator.dart';
import 'package:mycustomers/app/router.dart';
import 'package:mycustomers/core/services/permissions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:flutter/cupertino.dart';
import 'package:mycustomers/core/models/customer.dart';
import 'package:mycustomers/core/services/customer_services.dart';


class MarketingHomePageViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  // dummy data
  // TODO: implement service to get frequently contacted
  List _persons = [
    {'name': 'Seyi Onifade', 'number': '09088355273'},
    {'name': 'Mark Essien', 'number': '09088355273'},
    {'name': 'Ufe Atabo', 'number': '09088355273'}
  ];

  // TODO: implement service to get notification status
  bool _notification = true;

  bool get notification => _notification;

  List get persons => _persons;

  // Function to serve as a helper for the navigation
  Future navigateToSendMessageView() async {
    await _navigationService.navigateTo(Routes.sendMessageViewRoute);
  }

  // Get the services required
  ICustomerService _customerService = locator<ICustomerService>();

  List<Customer> allCustomers = [];

  List<Customer> _selectedCustomers = [];
  List<Customer> get selectedCustomers => _selectedCustomers;

  String _searchTerm = '';
  Pattern get searchPattern => RegExp('$_searchTerm', caseSensitive: false);

  List<Customer> _allSelectedCustomers = [];
  List<Customer> get searchedCustomer => allCustomers.where(
        (Customer customer) =>
    customer.name.contains(searchPattern) ||
        customer.lastName.contains(searchPattern) ||
        customer.phone.contains(searchPattern)||
        customer.email.contains(searchPattern),
  ).toList();
  List<Customer> get allSelectedCustomers => _allSelectedCustomers.where(
        (Customer customer) =>
            customer.name.contains(searchPattern) ||
            customer.lastName.contains(searchPattern) ||
            customer.phone.contains(searchPattern) ||
            customer.email.contains(searchPattern),
      ).toList();


  /// Data checking section

  bool get hasData => _allSelectedCustomers.isNotEmpty;
  bool get hasSelected => _selectedCustomers.isNotEmpty;
  int get numberOfSelected => _selectedCustomers.length;
  bool isSelected(Customer customer) => _selectedCustomers.contains(customer);
  bool get allSelected => _allSelectedCustomers.length == _selectedCustomers.length;

  TextEditingController searchController = TextEditingController();
  search(String keyword) {
    _searchTerm = keyword;
    notifyListeners();
  }

  void addCustomer(Customer customer) {
    _selectedCustomers.add(customer);
    notifyListeners();
  }

  void deselectCustomer(Customer customer) {
    _selectedCustomers.removeWhere((element) => element.id == customer.id);
    notifyListeners();
  }

  void selectAllCustomers() {
    _selectedCustomers.clear();
    _selectedCustomers.addAll(_allSelectedCustomers);
    notifyListeners();
  }

  void deselectAllCustomers() {
    _selectedCustomers = [];
    notifyListeners();
  }
//  void updateCustomers() async{
//    fianl customerList = await _navigationService
//  }

   Permissions _permission =  locator<Permissions>();

  Future navigateToAddCustomer() async {
    var contactList;
    final bool isPermitted =
        await _permission.getContactsPermission();
    if (isPermitted) contactList= await _navigationService
        .navigateTo(Routes.addCustomerMarketing);
    else await [Permission.contacts].request();
    allCustomers
     = await contactList.length != 0?contactList:allCustomers;
//    await contactList;
//    if(!contactList==null){allCustomers =  contactList;}
    notifyListeners();
    print(contactList);
  }


  void sendMessage(){
    _navigationService
        .navigateTo(Routes.sendMessageViewRoute);
  }

  /// View initialize and close section

  popView() {
    _navigationService.back();
  }

  returnCustomers() {
    _navigationService.back(result: _selectedCustomers);
  }

  @override
  Future futureToRun() async {
    _allSelectedCustomers = await _customerService.getCustomers('1');
  }
}
