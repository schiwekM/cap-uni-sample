using { cuid } from '@sap/cds/common';
using { tum.cap.sample.Studies, tum.cap.sample.Modules } from './studies';

namespace tum.cap.sample;

entity Students {
  key userID: String;
      firstName: String;
      lastName: String;
      displayName: String = (firstName || ' ' || lastName);
      study: Association to one Studies;
      modules : Composition of many ModuleAssignments on
        modules.student = $self;
}

entity ModuleAssignments : cuid {
  student : Association to one Students;
  module  : Association to one Modules;
}

annotate Students with {
    userID @title : '{i18n>USERID}' @Common.Text : user.displayName @Common.TextArrangement : #TextFirst;
    firstName @title : '{i18n>FIRSTNAME}';
    lastName @title : '{i18n>LASTNAME}';
    displayName @title: '{i18n>DISPLAYNAME}';
    study @title : '{i18n>STUDY}' @mandatory @Common.Text : study.name @Common.TextArrangement : #TextOnly @Common.ValueList : {
      CollectionPath : 'Studies',
      Parameters : [
          {
              $Type : 'Common.ValueListParameterInOut',
              LocalDataProperty : study_ID,
              ValueListProperty : 'ID',
          },
          {
              $Type : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty : 'initials',
          },
          {
              $Type : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty : 'name',
          },
      ],
    };
}