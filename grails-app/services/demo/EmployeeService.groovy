package demo

import grails.transaction.Transactional
import org.grails.web.json.JSONObject

@Transactional
class EmployeeService {
    DepartmentService departmentService

    def saveEmployee(params) {
        try {
            def department = departmentService.getDepartment(Integer.parseInt(params.department_id))
            def employee = new Employee(params);
            employee.department =  department;
            return employee.save(flush:true)
        }catch (Exception ignored) {
            return null;
        }
    }
    def updateEmployee(params) {
//        println("employee: "+employee)
        try {
            def employee = getEmployee(params.id)
            def department = Department.findById(params.department_id)
            println("employee: "+ employee)
            println("department: "+ department)
            if(employee != null){
                employee.name = params.name
                employee.age = params.age
                employee.position = params.position
                employee.department =  department
//                def result = employee.save()
                println("UPTemployee: "+ employee)
                return employee.save(flush:true)
            }else {
                return null
            }
        }catch (Exception ignored) {
            return null;
        }
    }

//    def saveEmployee( def params){
//        def department = Department.findById(Integer.parseInt(params.department_id))
//        def employee = new Employee(params);
//        employee.department =  department;
//        def result = employee.save();
//        println(result)
//        return result
//        [0].each{
//        def message =  new JSONObject()
//            try {
////                def employeeJson = request.JSON
////                def employeeInstance = new Employee(employeeJson)
////                employeeInstance = employeeInstance.save(flush:true)
////            if (!employeeInstance.hasErrors()){
////                return employeeInstance
////                message.put("status", "ok")
////                message.put("message", "Post Successfully !")
////                message.put("updatedResult", employeeInstance)
////            }else{
////                message.put("errorMessage", "Error !")
////            }
//            } catch(Exception ex) {
//                println(ex)
////            message.put("errorMessage", ex)
//            }
////        return message
//        }
//    }
//    def deleteEmployee(Long id) {
//        def employee = Employee.get(id)
//        if(employee) {
//            employee.delete()
//        }
//    }
//
    def getEmployees() {
        Employee.list()
    }
    def list() {
        def employeeList = Employee.list()
        return employeeList
    }
    def count() {
        def employeeCount = Employee.count()
        return employeeCount.toString()
    }
    def getEmployee(Long id) {
        Employee.get(id)
    }
}
