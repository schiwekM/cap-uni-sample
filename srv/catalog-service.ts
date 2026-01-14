import cds from '@sap/cds';
import { Module, ModuleAssignments } from '#cds-models/CatalogService'
// import { Students } from '../@cds-models/StudentsService';

export class CatalogService extends cds.ApplicationService {
    async init() {

        this.on(Module.actions.assign, async req => {
            console.log("Assign called", req.user)
            const assignmentExists = await SELECT.one.from(ModuleAssignments).where({
                module_moduleID: req.params.at(-1).moduleID,
                student_userID: req.user.id
            })
            if (assignmentExists) return req.error("Already assigned")
            await INSERT.into(ModuleAssignments).entries([{
                module_moduleID: req.params.at(-1).moduleID,
                student_userID: req.user.id
            }])

            // const x = await SELECT.one.from(Students).where({userID: req.user.id}).columns(student => { student.userID, student.firstName, student.modules (a => { a.module (m => {m.name})}) });
            req.info("Successfully assigned")
        })

        return super.init();
    }

}