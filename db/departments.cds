using { cuid, sap.common.CodeList } from '@sap/cds/common';
using { tum.cap.sample.Studies } from './studies';

namespace tum.cap.sample;

entity Departments : cuid {
    name : localized String;
    description : localized String;
    category : Association to one DepartmentCategories;
    studies : Composition of Studies on studies.department = $self;
}

entity DepartmentCategories : CodeList {
    key code: String(12);
        name : localized String(40)
}

annotate Departments with {
    ID @UI.Hidden @Core.Computed;
    name @title : '{i18n>NAME}';
    description @title : '{i18n>DESCRIPTION}' @UI.MultiLineText;
    category @title : '{i18n>CATEGORY}' @Common.Text : category.name @Common.TextArrangement : #TextOnly @Common.ValueListWithFixedValues;
    studies @title : '{i18n>STUDIES}';
}