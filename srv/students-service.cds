using {sbpa.cap.sample as persistence} from '../db/students';


service StudentsService {
    @odata.draft.enabled
    entity Students as projection on persistence.Students;

    entity Studies as projection on persistence.Studies;
}