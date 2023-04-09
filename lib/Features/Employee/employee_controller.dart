import 'package:get/get.dart';

import '../../Utils/loading_statud.dart';
import 'employee_model.dart';
import 'employee_services.dart';

class EmployeeController extends GetxController {
  EmployeeListModel? employeeList = EmployeeListModel.fromJson({
    "status": LoadingStatus.NOT_STARTED,
    "page": 1,
    "last_page": 1,
    "list": [],
  });
// ========================================
// =========== Load List OF Employees ================
// ========================================

  Future loadEmployeeList() async {
    if (employeeList!.page == 1) {
      employeeList!.status = LoadingStatus.IN_PROGRESS;
      update();
      employeeList =
          await EmployeeAPI().loadEmployeeListAPI(page: employeeList!.page!);
    } else {
      employeeList!.status = LoadingStatus.IN_SECOND_PROGRESS;
      update();
      EmployeeListModel? swapEmployeeList =
          await EmployeeAPI().loadEmployeeListAPI(page: employeeList!.page!);
      if (swapEmployeeList.isLoadSuccess()) {
        employeeList!.list!.addAll(swapEmployeeList.list!);
        employeeList!.page = swapEmployeeList.page;
      }
      employeeList!.status = LoadingStatus.DONE;
    }
    update();
  }
}
