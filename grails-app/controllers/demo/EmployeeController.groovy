package demo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class EmployeeController {
    EmployeeService employeeService
    DepartmentService departmentService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render view : 'index.gsp', model: [employeeList: employeeService.list()]
//        render view : 'index.gsp', model: [employeeCount: employeeService.count(), employeeList: employeeService.list()]
//        respond model:[employeeCount: "Employee.count()", employeeList: "Employee.list()"]
    }

    def create(){
        Employee employee = new Employee(params)
        [employee: employee, departmentList: departmentService.list()]
    }

    @Transactional
    def save() {
        def result = employeeService.saveEmployee(params)
        if (result != null){
            flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), params.name])
            redirect (controller:"employee", action: "index")
        }else {
            respond "error saving value"
            redirect (controller:"employee", action: "index")
        }
    }

    def employeeList(){
        def allEmployees = employeeService.list()
        respond allEmployees
    }

    def show(Employee employee) {
        respond employee
    }

    def edit(Employee employee) {
//        Employee employee = Employee(params)
//        respond employee
        [employee: employee, departmentList: departmentService.list()]
    }

    @Transactional
    def update() {
        def result = employeeService.updateEmployee(params)
        if (result != null){
            flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), params.name])
            redirect (controller:"employee", action: "index")
        }else {
            respond "error saving value"
            render view: "index.gsp"
        }
    }
    @Transactional
    def delete(Employee employee) {
        if (employee == null) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            return
        }
        employee.delete flush:true
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), employee.id])
        redirect action:"index", method:"GET"

    }
    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
        redirect action: "index", method: "GET"
    }
//    def save() {
//        def result = employeeService.saveEmployee(params)
//        if (result != null){
//            flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), result])
//            redirect (controller:"employee", action: "index")
//        }else {
//            respond "error saving value"
//            redirect (controller:"employee", action: "index")
//        }
//        if (employee.hasErrors()) {
//            respond employee.errors, view:'create'
//            return
//        }
//        def department = Department.findById(Integer.parseInt(params.department_id))
//        employee.department =  department;
//        def result = employee.save();
//        println(result)
//        employee.save flush:true
//        flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employee.id])
//    }
}
