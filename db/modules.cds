using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';
using {tum.cap.sample.Studies} from './studies';

namespace tum.cap.sample;

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
}

entity ExamOptions : cuid, managed {
  module         : Association to one Modules;
  name           : String(255);
  type           : Association to one ExamTypes;
  isDefault      : Boolean default true;
}

entity ExamTypes : CodeList {
  key code : String(3)  @Common.Text: name  @Common.TextArrangement: #TextOnly;
      name : localized String(16);
}