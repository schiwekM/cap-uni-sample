using {cuid} from '@sap/cds/common';
using { sbpa.cap.sample.ModuleAssignments, sbpa.cap.sample.Students } from './students';

namespace sbpa.cap.sample;

entity Studies {
    key SubjectID : String;
    name: String;
    creditsForCompletion: Integer default 100;
    duration: Decimal(3, 1) default 3.0;
    modules: Composition of many Modules on modules.study = $self;
    students: Association to many Students on students.study = $self
}

entity Modules {
    key moduleID: String;
    name: String;
    credits: Decimal(3, 1) default 5;
    weight: Decimal(7, 2) default 1;
    hasFixedWeight: Boolean default true;
    validFrom: Date;
    validTo: Date default '9999-12-31';
    isMandatory: Boolean default false;
    isFinalThesis: Boolean default false;
    additionalInfo: String(1000);
    assignments: Association to many ModuleAssignments on assignments.module = $self;
    study: Association to one Studies;
}
