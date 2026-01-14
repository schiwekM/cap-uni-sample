using {sbpa.cap.sample as studies} from '../db/studies';
using from '../db/students';

@requires: 'Student'
service CatalogService {

    entity Modules as projection on studies.Modules actions {
        action assign();
    };

    entity ModuleAssignments as projection on studies.ModuleAssignments;
}