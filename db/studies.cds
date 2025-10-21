using { cuid, User } from '@sap/cds/common';
using { tum.cap.sample.Departments } from './departments';

namespace tum.cap.sample;

@assert.unique: {uniqueStudies: [
  initials,
  department
]}
entity Studies : cuid {
    initials: String(16);
    name: localized String(255);
    department : Association to one Departments;
    creditsForCompletion : Integer default 180;
    semestersPerYear     : UInt8 default 2;
    duration             : Decimal(3, 1) default 3.0;
    maintainers          : Composition of many StudyMaintainers
                           on maintainers.study = $self;
}

@assert.unique: {oneAssignmentPerStudy: [
  study,
  maintainer
]}
entity StudyMaintainers : cuid {
  study        : Association to one Studies;
  maintainer   : User;
  autoAssigned : Boolean default false;
}

annotate Studies with {
    ID @UI.Hidden @Core.Computed;
    initials @title : '{i18n>INITIALS}';
    name @title : '{i18n>NAME}';
    department @title : '{i18n>DEPARTMENT}' @Common.Text : department.name @Common.TextArrangement : #TextOnly @Common.ValueListWithFixedValues;
}