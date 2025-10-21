using ModuleCatalogue as srv from './catalogue-service';


annotate srv.Modules with @restrict : [
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
];

annotate srv.ModuleAssignments with @restrict : [
    {
        grant: [
            'READ',
            'unassign'
        ],
        to: ['Student'],
        where: ($user.id = student.userID)
    },
];

