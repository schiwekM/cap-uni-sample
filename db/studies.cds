using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';
using { tum.cap.sample.Students, tum.cap.sample.ModuleAssignments } from './students';

namespace tum.cap.sample;

entity Studies : cuid {
    initials: String(16);
    name: localized String(255);
    creditsForCompletion : Integer default 180;
    semestersPerYear     : UInt8 default 2;
    duration             : Decimal(3, 1) default 3.0;
    modules : Composition of many Modules on modules.study = $self;

    students : Association to many Students on students.study = $self;
}

entity Modules : cuid {
    study              : Association to one Studies;
    name               : String(255);
    credits            : Decimal(3, 1) default 5;
    weight             : Decimal(7, 2) default 1;
    hasFixedWeight     : Boolean default true;
    validFrom          : Date;
    validTo            : Date default '9999-12-31';
    isMandatory        : Boolean default false;
    isFinalThesis      : Boolean default false;
    additionalInfo     : String(1000);
    examOptions        : Composition of many ExamOptions
                            on examOptions.module = $self;
    assignments : Association to many ModuleAssignments on assignments.module = $self;
}

entity ExamOptions : cuid, managed {
  module         : Association to one Modules;
  name           : String(255);
  type           : Association to one ExamTypes;
  isDefault      : Boolean default true;
}

entity ExamTypes : CodeList {
  key code : String(12)  @Common.Text: name  @Common.TextArrangement: #TextOnly;
      name : localized String(16);
}

annotate Studies with {
    ID @UI.Hidden @Core.Computed;
    initials @title : '{i18n>INITIALS}';
    name @title : '{i18n>NAME}';
}