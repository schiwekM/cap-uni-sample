using { User } from '@sap/cds/common';

namespace tum.cap.sample.common;

entity Users {
    key userId : User;
        firstName: String;
        lastName: String;
        displayName: String = (firstName || ' ' || lastName)
}

annotate Users with {
    userId @title : '{i18n>USERID}';
    firstName @title : '{i18n>FIRSTNAME}';
    lastName @title : '{i18n>LASTNAME}';
    displayName @title: '{i18n>DISPLAYNAME}';
}