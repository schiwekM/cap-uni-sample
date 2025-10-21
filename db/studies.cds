using { cuid } from '@sap/cds/common';
using { tum.cap.sample.Students, tum.cap.sample.ModuleAssignments } from './students';

namespace tum.cap.sample;

entity Studies : cuid {
    initials: String(16);
    name: localized String(255);
    creditsForCompletion : Integer default 180;
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
    assignments : Association to many ModuleAssignments on assignments.module = $self;
}

annotate Studies with {
    ID @UI.Hidden @Core.Computed;
    initials @title : '{i18n>INITIALS}';
    name @title : '{i18n>NAME}' @mandatory;
    creditsForCompletion @title : '{i18n>CREDITS_FOR_COMPLETION}';
    duration @title : '{i18n>DURATION}';
}

annotate Modules with {
    ID @UI.Hidden @Core.Computed;
    name @title : '{i18n>NAME}' @mandatory;
    credits @title : '{i18n>CREDITS}';
    weight @title : '{WEIGHT}' @Common.FieldControl : (hasFixedWeight ? 7 : 0);
    hasFixedWeight @title : '{i18n>HAS_FIXED_WEIGHT}';
    validFrom @title : '{i18n>VALID_FROM}';
    validTo @title : '{i18n>VALID_TO}';
    isMandatory @title : '{i18n>IS_MANDATORY}';
    isFinalThesis @title : '{i18n>IS_FINAL_THESIS}';
    additionalInfo @title : '{i18n>ADDITIONAL_INFO}' @UI.MultiLineText;
}