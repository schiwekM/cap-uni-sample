using {tum.cap.sample as persistence} from '../db/studies';

service StudiesManagement {

    @odata.draft.enabled
    entity Studies as projection on persistence.Studies;
}