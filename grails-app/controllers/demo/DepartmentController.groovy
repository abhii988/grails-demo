package demo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class DepartmentController {
    DepartmentService departmentService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render view : 'index.gsp', model: [departmentCount: departmentService.count(), departmentList: departmentService.list()]
//        respond Department.list(params), model:[departmentCount: Department.count()]
        if(params.id){
            respond departmentService.getDepartment(params.id)
        }
    }

    def show(Department department) {
        respond department
    }

    def create() {
        respond new Department(params)
    }

    @Transactional
    def save(Department department) {
        if (department.hasErrors()) {
            respond department.errors, view:'create'
            return
        }
//        department.save flush:true
        departmentService.saveDepartment(department)
        flash.message = message(code: 'default.created.message', args: [message(code: 'department.label', default: 'Department'), department.id])
        redirect (controller:"department", action: "index")
    }

    def edit(Department department) {
        respond department
    }

    @Transactional
    def update(Department department) {
        if (department.hasErrors()) {
            respond department.errors, view:'edit'
            return
        }
        departmentService.saveDepartment(department)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'department.label', default: 'Department'), department.id])
        redirect (controller:"department", action: "index")
    }

    @Transactional
    def delete(Department department) {
        if (department.hasErrors()) {
            respond department.errors, view:'create'
            return
        }
        if (department == null) {
            notFound()
            return
        }
        department.delete flush:true
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'department.label', default: 'Department'), department.id])
        redirect action:"index", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
        redirect action: "index", method: "GET"
    }
}
