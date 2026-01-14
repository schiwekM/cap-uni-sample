using { sbpa.cap.sample as persistence} from '../db/studies';

service StudiesService {
    @odata.draft.enabled
    entity Studies as projection on persistence.Studies;
}