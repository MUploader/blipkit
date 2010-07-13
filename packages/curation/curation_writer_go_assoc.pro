/* -*- Mode: Prolog -*- */

:- module(curation_writer_go_assoc,
          [
           ]).

:- use_module(bio(mode)).
:- use_module(bio(curation_db)).
:- use_module(bio(metadata_db)).
:- use_module(bio(ontol_db)).
:- use_module(bio(seqfeature_db)).
:- use_module(bio(bioprolog_util)).

io:redirect_stdout(go_assoc).
        
io:write_all(go_assoc,_,_):-
        write_header(go_assoc),
        forall(curation_statement(A,S,R,O),
               write_curation_statement(A,S,R,O)).

        
:- mode write_header/1 is det.
write_header(go_assoc):-
        format('! autogenerated~n').

:- mode write_curation_statement/1 is det.
write_curation_statement(A,S,_Rel,To):-
        expand_obo_id(To,ToExp),
        Pairs = [
                 DB - entity_authority(S,DB),
                 Local - entity_localname(S,Local),
                 Name - entity_label(S,Name),
                 '' - true,     % TODO; not; dont show has_role
                 ToExp - true,
                 Source - entity_source(A,Source),
                 Code - curation_evidence_code(A,Code),
                 With - curation_evidence_with(A,With), % TODO
                 Aspect - id_aspect(ToExp,Aspect),
                 Symbol - entity_label(S,Symbol),
                 Synonyms - findall(Synonym,(   entity_synonym(S,Synonym)
                                            ;   entity_xref(S,Synonym)), % treat xrefs as synonyms
                                    Synonyms),
                 Type - ( subclass(S,Type) ; inst_of(S,Type) ),
                 Taxon - (feature_organism(S,NCBITaxon),
                          atom_concat('NCBITaxon:',TaxID,NCBITaxon),
                          atom_concat('taxon:',TaxID,Taxon)),
                 Date - (entity_created(A,ISO_Date),
                         concat_atom(Toks,':',ISO_Date),
                         concat_atom(Toks,,Date)),
                 SourceDB - entity_publisher(A,SourceDB),
                 PVAtom - pv_atom(ToExp,A,PVAtom),
                 IsoForm - curation_isform(A,IsoForm)
               ],
        findall(Val,(member(Pair,Pairs),flatten_colpair(Pair,Val)),Vals),
        atom_codes(Tab,"\t"),
        concat_atom(Vals,Tab,Line),
        write(Line),
        nl.

id_aspect(ID,A) :-
        belongs(ID,O),
        ontology_aspect(O,A).

ontology_aspect(biological_process,'P').
ontology_aspect(molecular_function,'F').
ontology_aspect(cellular_component,'C').

pv_atom(C,Ann,PVA) :-
        findall(PV,
                (   curation_subject_property_value(Ann,C,P,V),
                    sformat('~w(~w)',[P,V])),
                PVs),
        concat_atom(PVs,',',PVA).


flatten_colpair(X,V):-
        flatten_colpair1(X,V1),
        (   is_list(V1)
        ->  concat_atom(V1,'| ',V)
        ;   V=V1).

flatten_colpair1(Template-Goal,Template):-
        Goal,
        !.
flatten_colpair1(_,'').
        
expand_obo_id(In,Out):-
        is_anonymous(In),
        genus(In,Genus),
        !,
        findall(Diff,
                expand_differentium(In,Diff),
                Diffs),
        concat_atom([Genus|Diffs],'^',Out).
expand_obo_id(X,X).

expand_differentium(Class,Atom):-
        differentium(Class,R,To),
        expand_obo_id(To,ToExp),
        sformat(Atom,'~w(~w)',[R,ToExp]).


                
             
