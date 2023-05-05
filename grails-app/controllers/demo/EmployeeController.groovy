package demo

import grails.transaction.Transactional
import groovy.sql.Sql
import pl.touk.excel.export.WebXlsxExporter

@Transactional(readOnly = false)
class EmployeeController {
    EmployeeService employeeService
    DepartmentService departmentService
    def dataSource

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        try{
            render(view: 'index', model: [employeeList: employeeService.getAllEmployees(params), employeeCount: employeeService.getEmployeeCount()])
        }catch (Exception e){
            flash.error = e.message
            render(view: 'index')
        }
//        render view : 'index.gsp', model: [employeeCount: employeeService.count(), employeeList: employeeService.list()]
    }

    def create(){
        Employee employee = new Employee(params)
        [employee: employee, departmentList: departmentService.getAllDepartments()]
    }

    @Transactional
    def save() {
        try{
            def result = employeeService.saveEmployee(params)
            if (result != null){
                if (result.errors.allErrors){
                    flash.error = "Unable to add Employee as '"+ result.errors.allErrors[0].field + "' cannot accept the value '" + result.errors.allErrors[0].rejectedValue + "'"
                    redirect (controller:"employee", action: "index")
                }else {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), params.name])
                    redirect (controller:"employee", action: "index")
                }
            }else {
                notFound()
            }
        }catch (Exception e) {
            println(e.message)
//            flash.error = "Could not add employee ${params.name}"
            redirect(action: "index")
        }

    }

    def show(Employee employee) {
        respond employee
    }

    def edit(Employee employee) {
        [employee: employee, departmentList: departmentService.getAllDepartments()]
    }

    @Transactional
    def update() {
        try{
            def result = employeeService.updateEmployee(params)
            if (result != null){
                flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), params.name])
                redirect (controller:"employee", action: "index")
            }else {
                notFound()
            }
        }catch (Exception e){
            flash.error = e.message
            redirect (controller:"employee", action: "index")
        }

    }
    @Transactional
    def delete(Employee employee) {
        try{
            if (employee == null) {
                notFound()
            }
            employee.delete flush:true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), employee.name])
            redirect action:"index", method:"GET"
        }catch (Exception e){
            flash.error = e.message
            redirect (controller:"employee", action: "index")
        }
    }
    def download() {
        String query = "select e.id as id, e.name as name, e.age as age, e.position as position, e.department_id as department_id, d.name as department_name, d.unit as department_unit, d.manager as department_manager from employee e join department d on e.department_id = d.id;"
        def sql = new Sql(dataSource);
        def employees = sql.rows(query);
        def headers = ['Name', 'Age', 'Position', 'Department Name', 'Department Unit', 'Department Manager']
        def withProperties = ['name', 'age', 'position', 'department_name', 'department_unit', 'department_manager']
        new WebXlsxExporter().with {
            setResponseHeaders(response)
            fillHeader(headers)
            add(employees, withProperties)
            save(response.outputStream)
        }
    }
    protected void notFound() {
        flash.error = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
        redirect action: "index", method: "GET"
    }
}
