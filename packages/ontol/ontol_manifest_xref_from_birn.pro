:- module(ontol_manifest_xref_from_birn,[]).

:- use_module(bio(ontol_db)).

metadata_db:entity_xref(ID,Xref):-
        inst_sv(ID,'sao:gene_Ontology_ID',Num,_),
        concat_atom(['GO',Num],':',Xref).


