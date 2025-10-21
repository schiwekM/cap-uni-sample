using { cuid, User } from '@sap/cds/common';
using { tum.cap.sample.Studies } from './studies';
using { tum.cap.sample.common.Users } from './common';

namespace tum.cap.sample;

entity Students {
  key userID: String;
      user : Association to one Users;
      study: Association to one Studies;
}

annotate Students with {
    userID @title : '{i18n>USERID}' @Common.Text : user.displayName @Common.TextArrangement : #TextFirst;
    study @title : '{i18n>STUDY}' @Common.Text : study.name @Common.TextArrangement : #TextOnly;
}