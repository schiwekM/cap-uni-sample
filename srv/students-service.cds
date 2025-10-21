using {tum.cap.sample as persistence} from '../db/students';

service StudentsManagement {

    @odata.draft.enabled
    entity Students as projection on persistence.Students;

    entity Studies as projection on persistence.Studies {
        ID,
        name,
        initials
    };
}