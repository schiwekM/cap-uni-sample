using {tum.cap.sample as persistence} from '../db/studies';
using from '../db/students';

service ModuleCatalogue {

    @restrict : [
        {
            grant: [
                'READ',
            ],
            to: ['Student'],
            where: (exists study.students[userID = $user.id])
        },
        {
            grant: [
                'assign'
            ],
            to: ['Student'],
            where: (not exists assignments[student.userID = $user.id])
        },
    ]
    entity Modules as projection on persistence.Modules {
        *,
        (not exists assignments[student.userID = $user.id]) as isUserAssigned: Boolean @(UI.Hidden),
    } actions {
        @(
            Core.OperationAvailable : (not $self.isUserAssigned),
            Common.SideEffects : {
                TargetProperties : [in.isUserAssigned]
            }
        )
        action assign();
    };


    @restrict : [
        {
            grant: [
                'READ',
                'unassign'
            ],
            to: ['Student'],
            where: ($user.id = student.userID)
        },
    ]
    entity ModuleAssignments as projection on persistence.ModuleAssignments actions {
        @(
            Common.SideEffects : {
                TargetEntities : ['/ModuleCatalogue.EntityContainer/ModuleAssignments']
            }
        )
        action unassign();
    };
}