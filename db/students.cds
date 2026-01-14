using {cuid} from '@sap/cds/common';
using {sbpa.cap.sample.Modules, sbpa.cap.sample.Studies} from './studies';

namespace sbpa.cap.sample;

entity Students {
    key userID: String;
    firstName: String;
    lastName: String;
    study: Association to one Studies;
    modules: Composition of many ModuleAssignments on modules.student = $self;
}

entity ModuleAssignments : cuid {
    student: Association to one Students;
    module: Association to one Modules;
}