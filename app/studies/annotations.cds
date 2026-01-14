using StudiesService as service from '../../srv/studies-service';
using from '../../db/studies';

annotate service.Studies with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'SubjectID',
                Value : SubjectID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'creditsForCompletion',
                Value : creditsForCompletion,
            },
            {
                $Type : 'UI.DataField',
                Label : 'duration',
                Value : duration,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Modules',
            ID : 'Modules',
            Target : 'modules/@UI.LineItem#Modules',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'SubjectID',
            Value : SubjectID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'creditsForCompletion',
            Value : creditsForCompletion,
        },
        {
            $Type : 'UI.DataField',
            Label : 'duration',
            Value : duration,
        },
    ],
);

annotate service.Modules with @(
    UI.LineItem #Modules : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : credits,
            Label : 'credits',
        },
        {
            $Type : 'UI.DataField',
            Value : isMandatory,
            Label : 'isMandatory',
        },
    ]
);

