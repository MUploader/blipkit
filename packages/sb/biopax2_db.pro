%% <module> biopax2_db
% Autogenerated by ontol_bridge_to_schema
% Example: blip -i biopax-level2.owl ontol-schema  -local biopax2 -ns "http://www.biopax.org/release/biopax-level2.owl#"

:-module(biopax2_db, [dataSource/1, openControlledVocabulary/1, xref/1, bioSource/1, externalReferenceUtilityClass/1, publicationXref/1, unificationXref/1, sequenceParticipant/1, physicalEntityParticipant/1, transportWithBiochemicalReaction/1, biochemicalReaction/1, transport/1, complexAssembly/1, conversion/1, physicalEntity/1, interaction/1, entity/1, pathway/1, relationshipXref/1, physicalInteraction/1, smallMolecule/1, protein/1, rna/1, dna/1, complex/1, sequenceLocation/1, kPrime/1, deltaGprimeO/1, chemicalStructure/1, experimentalForm/1, confidence/1, evidence/1, utilityClass/1, pathwayStep/1, sequenceFeature/1, sequenceInterval/1, sequenceSite/1, modulation/1, catalysis/1, control/1, xref/2, participants/2, sequence_interval_end/2, sequence_interval_begin/2, feature_type/2, step_interactions/2, organism/2, controlled/2, controller/2, participant/2, experimental_form_type/2, cellular_location/2, physical_entity/2, confidence/2, evidence_code/2, experimental_form/2, tissue/2, celltype/2, taxon_xref/2, pathway_components/2, evidence/2, right/2, interaction_type/2, delta_g/2, structure/2, sequence_feature_list/2, left/2, components/2, cofactor/2, next_step/2, feature_location/2, keq/2, data_source/2, db/2, id/2, relationship_type/2, molecular_weight/2, chemical_formula/2, sequence_position/2, position_status/2, year/2, title/2, biopax_name/2, short_name/2, confidence_value/2, sequence/2, db_version/2, id_version/2, control_type/2, ph/2, temperature/2, ionic_strength/2, k_prime/2, pmg/2, stoichiometric_coefficient/2, delta_g_prime_o/2, direction/2, spontaneous/2, structure_data/2, structure_format/2, authors/2, availability/2, synonyms/2, delta_s/2, source/2, delta_h/2, biopax_comment/2, url/2, term/2, ec_number/2, op(300, xfy, xref), op(300, xfy, participants), op(300, xfy, sequence_interval_end), op(300, xfy, sequence_interval_begin), op(300, xfy, feature_type), op(300, xfy, step_interactions), op(300, xfy, organism), op(300, xfy, controlled), op(300, xfy, controller), op(300, xfy, participant), op(300, xfy, experimental_form_type), op(300, xfy, cellular_location), op(300, xfy, physical_entity), op(300, xfy, confidence), op(300, xfy, evidence_code), op(300, xfy, experimental_form), op(300, xfy, tissue), op(300, xfy, celltype), op(300, xfy, taxon_xref), op(300, xfy, pathway_components), op(300, xfy, evidence), op(300, xfy, right), op(300, xfy, interaction_type), op(300, xfy, delta_g), op(300, xfy, structure), op(300, xfy, sequence_feature_list), op(300, xfy, left), op(300, xfy, components), op(300, xfy, cofactor), op(300, xfy, next_step), op(300, xfy, feature_location), op(300, xfy, keq), op(300, xfy, data_source), op(300, xfy, db), op(300, xfy, id), op(300, xfy, relationship_type), op(300, xfy, molecular_weight), op(300, xfy, chemical_formula), op(300, xfy, sequence_position), op(300, xfy, position_status), op(300, xfy, year), op(300, xfy, title), op(300, xfy, biopax_name), op(300, xfy, short_name), op(300, xfy, confidence_value), op(300, xfy, sequence), op(300, xfy, db_version), op(300, xfy, id_version), op(300, xfy, control_type), op(300, xfy, ph), op(300, xfy, temperature), op(300, xfy, ionic_strength), op(300, xfy, k_prime), op(300, xfy, pmg), op(300, xfy, stoichiometric_coefficient), op(300, xfy, delta_g_prime_o), op(300, xfy, direction), op(300, xfy, spontaneous), op(300, xfy, structure_data), op(300, xfy, structure_format), op(300, xfy, authors), op(300, xfy, availability), op(300, xfy, synonyms), op(300, xfy, delta_s), op(300, xfy, source), op(300, xfy, delta_h), op(300, xfy, biopax_comment), op(300, xfy, url), op(300, xfy, term), op(300, xfy, ec_number)]).

:- use_module(bio(dbmeta)).

:- datapreds([dataSource/1, openControlledVocabulary/1, xref/1, bioSource/1, externalReferenceUtilityClass/1, publicationXref/1, unificationXref/1, sequenceParticipant/1, physicalEntityParticipant/1, transportWithBiochemicalReaction/1, biochemicalReaction/1, transport/1, complexAssembly/1, conversion/1, physicalEntity/1, interaction/1, entity/1, pathway/1, relationshipXref/1, physicalInteraction/1, smallMolecule/1, protein/1, rna/1, dna/1, complex/1, sequenceLocation/1, kPrime/1, deltaGprimeO/1, chemicalStructure/1, experimentalForm/1, confidence/1, evidence/1, utilityClass/1, pathwayStep/1, sequenceFeature/1, sequenceInterval/1, sequenceSite/1, modulation/1, catalysis/1, control/1, xref/2, participants/2, sequence_interval_end/2, sequence_interval_begin/2, feature_type/2, step_interactions/2, organism/2, controlled/2, controller/2, participant/2, experimental_form_type/2, cellular_location/2, physical_entity/2, confidence/2, evidence_code/2, experimental_form/2, tissue/2, celltype/2, taxon_xref/2, pathway_components/2, evidence/2, right/2, interaction_type/2, delta_g/2, structure/2, sequence_feature_list/2, left/2, components/2, cofactor/2, next_step/2, feature_location/2, keq/2, data_source/2, db/2, id/2, relationship_type/2, molecular_weight/2, chemical_formula/2, sequence_position/2, position_status/2, year/2, title/2, biopax_name/2, short_name/2, confidence_value/2, sequence/2, db_version/2, id_version/2, control_type/2, ph/2, temperature/2, ionic_strength/2, k_prime/2, pmg/2, stoichiometric_coefficient/2, delta_g_prime_o/2, direction/2, spontaneous/2, structure_data/2, structure_format/2, authors/2, availability/2, synonyms/2, delta_s/2, source/2, delta_h/2, biopax_comment/2, url/2, term/2, ec_number/2]).

:-op(300, xfy, xref).
:-op(300, xfy, participants).
:-op(300, xfy, sequence_interval_end).
:-op(300, xfy, sequence_interval_begin).
:-op(300, xfy, feature_type).
:-op(300, xfy, step_interactions).
:-op(300, xfy, organism).
:-op(300, xfy, controlled).
:-op(300, xfy, controller).
:-op(300, xfy, participant).
:-op(300, xfy, experimental_form_type).
:-op(300, xfy, cellular_location).
:-op(300, xfy, physical_entity).
:-op(300, xfy, confidence).
:-op(300, xfy, evidence_code).
:-op(300, xfy, experimental_form).
:-op(300, xfy, tissue).
:-op(300, xfy, celltype).
:-op(300, xfy, taxon_xref).
:-op(300, xfy, pathway_components).
:-op(300, xfy, evidence).
:-op(300, xfy, right).
:-op(300, xfy, interaction_type).
:-op(300, xfy, delta_g).
:-op(300, xfy, structure).
:-op(300, xfy, sequence_feature_list).
:-op(300, xfy, left).
:-op(300, xfy, components).
:-op(300, xfy, cofactor).
:-op(300, xfy, next_step).
:-op(300, xfy, feature_location).
:-op(300, xfy, keq).
:-op(300, xfy, data_source).
:-op(300, xfy, db).
:-op(300, xfy, id).
:-op(300, xfy, relationship_type).
:-op(300, xfy, molecular_weight).
:-op(300, xfy, chemical_formula).
:-op(300, xfy, sequence_position).
:-op(300, xfy, position_status).
:-op(300, xfy, year).
:-op(300, xfy, title).
:-op(300, xfy, biopax_name).
:-op(300, xfy, short_name).
:-op(300, xfy, confidence_value).
:-op(300, xfy, sequence).
:-op(300, xfy, db_version).
:-op(300, xfy, id_version).
:-op(300, xfy, control_type).
:-op(300, xfy, ph).
:-op(300, xfy, temperature).
:-op(300, xfy, ionic_strength).
:-op(300, xfy, k_prime).
:-op(300, xfy, pmg).
:-op(300, xfy, stoichiometric_coefficient).
:-op(300, xfy, delta_g_prime_o).
:-op(300, xfy, direction).
:-op(300, xfy, spontaneous).
:-op(300, xfy, structure_data).
:-op(300, xfy, structure_format).
:-op(300, xfy, authors).
:-op(300, xfy, availability).
:-op(300, xfy, synonyms).
:-op(300, xfy, delta_s).
:-op(300, xfy, source).
:-op(300, xfy, delta_h).
:-op(300, xfy, biopax_comment).
:-op(300, xfy, url).
:-op(300, xfy, term).
:-op(300, xfy, ec_number).


