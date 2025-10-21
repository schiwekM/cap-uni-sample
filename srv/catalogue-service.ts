
import cds from '@sap/cds'
import { Module, ModuleAssignment, ModuleAssignments } from '#cds-models/ModuleCatalogue'

export class ModuleCatalogue extends cds.ApplicationService { init() {

  this.on(Module.actions.assign, async req => {

    await INSERT.into(ModuleAssignments).entries([{
        module_ID: req.params.at(-1).ID,
        student_userID : req.user.id
    }])
  });

  
  return super.init()

}}
