using {tum.cap.sample as persistence} from '../db/studies';
using from '../db/students';

service ModuleCatalogue {

    entity Modules as projection on persistence.Modules actions {
        action assign();
    };


    entity ModuleAssignments as projection on persistence.ModuleAssignments actions {
        action unassign();
    };
}