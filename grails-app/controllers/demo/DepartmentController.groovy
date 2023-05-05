package demo

import grails.transaction.Transactional
import pl.touk.excel.export.WebXlsxExporter
import pl.touk.excel.export.XlsxExporter

@Transactional(readOnly = false)
class DepartmentController {
    DepartmentService departmentService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render view : 'index', model: [departmentCount: departmentService.getDepartmentCount(), departmentList: departmentService.getAllDepartments(params)]
    }

    def show(Department department) {
        respond department
    }

    def create() {
        respond new Department(params)
    }

    @Transactional
    def save() {
        try{
            def result = departmentService.saveDepartment(params)
            if (result != null){
                if (result.errors){
                    flash.error = result.errors.allErrors[0]
                    redirect (controller:"department", action: "index")
                }else {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'department.label', default: 'Department'), params.name])
                    redirect(controller: "department", action: "index")
                }
            }else {
                notFound()
            }
        }catch (Exception e) {
            println(e.message)
//            flash.error = "Could not add department ${params.name}"
            redirect(action: "index")
        }
    }

    def edit(Department department) {
        respond department
    }

    @Transactional
    def update() {
        try {
            def result = departmentService.updateDepartment(params)
            if (result != null){
                flash.message = message(code: 'default.updated.message', args: [message(code: 'department.label', default: 'Department'), params.name])
                redirect(controller: "department", action: "index")
            }else {
                notFound()
            }

        }catch (Exception e){
            flash.error = e.message
            redirect (controller:"employee", action: "index")
        }
    }

    @Transactional
    def delete(Department department) {
        try{
            if (department == null) {
                notFound()
                return
            }
            department.delete flush:true
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'department.label', default: 'Department'), department.name])
            redirect action:"index", method:"GET"
        }catch (Exception e) {
            println(e.message)
            flash.error = "Cannot delete Department as it is referenced as a Foreign Key in Employee's Table"
            redirect action:"index"
        }

    }
    def download() {
        def departments = Department.findAll()
        def headers = ['Name','Unit', 'Manager']
        def withProperties = ['name', 'unit', 'manager']
        new WebXlsxExporter().with {
            setResponseHeaders(response)
            fillHeader(headers)
            add(departments, withProperties)
            save(response.outputStream)
        }
    }
    protected void notFound() {
        flash.error = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.name])
        redirect action: "index", method: "GET"
    }
}
