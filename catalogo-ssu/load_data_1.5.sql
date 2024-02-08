-- START database loading

-- RESET database
	-- BLOCK: proceeding, form & attachment	
	-- depend on BLOCK: lookup table
	
	delete from endoproceeding;
	alter sequence endoproceeding_k_id_seq restart with 1;
	
	delete from usecase_proceeding;
	alter sequence usecase_proceeding_k_id_seq restart with 1;
		
	delete from proceeding_attachment;
	alter sequence proceeding_attachment_k_id_seq restart with 1;
	
	delete from proceeding;
	alter sequence proceeding_k_id_seq restart with 1;
	
	delete from attachment;
	alter sequence attachment_k_id_seq restart with 1;
	
	delete from form;
	alter sequence form_k_id_seq restart with 1;
	
	delete from schematron;
	alter sequence schematron_k_id_seq restart with 1;
	
	delete from xsd;
	alter sequence xsd_k_id_seq restart with 1;
	
	
    -- BLOCK: competent_administration & component ET
	-- depend on BLOCK: lookup table
	
	delete from competent_administration_territorial_scope;
	alter sequence competent_administration_territorial_scope_k_id_seq restart with 1;
	
	delete from competent_administration_work;
	alter sequence competent_administration_work_k_id_seq restart with 1;
	
	delete from competent_administration;
	alter sequence competent_administration_k_id_seq restart with 1;
		
	delete from third_party_system;
	alter sequence third_party_system_k_id_seq restart with 1;
	
	-- BLOCK: SUAP & component BO/FO
	-- depend on BLOCK: lookup table
	delete from single_desk;
	alter sequence single_desk_k_id_seq restart with 1;

	delete from fo_system;
	alter sequence fo_system_k_id_seq restart with 1;

	delete from bo_system;
	alter sequence bo_system_k_id_seq restart with 1;
		
	-- BLOCK: lookup table
	-- indipendent
	delete from typology;
	alter sequence typology_k_id_seq restart with 1;
	
	delete from life_event;
	alter sequence life_event_k_id_seq restart with 1;
	
	delete from administrative_regime;
	alter sequence administrative_regime_k_id_seq restart with 1;
		
	delete from territorial_scope;
	alter sequence territorial_scope_k_id_seq restart with 1;
	
	delete from competent_administration_class;
	alter sequence competent_administration_class_k_id_seq restart with 1;
	


-- TABLE competent_administration_class
	insert into competent_administration_class (description) 
			values ('Comune');
	insert into competent_administration_class (description) 
			values ('ASL');

-- TABLE typology
	insert into typology (id, description) 
			values ('VICINATO',				    
				    'ESERCIZIO DI VICINATO'				    
				   );	
	insert into typology (id, description) 
			values ('MEDIA_GRANDE_STRUTTURA',				    
				    'MEDIA O GRANDE STRUTTURA DI VENDITA'				    
				   );
	insert into typology (id, description) 
			values ('NOTIFICA_SANITARIA',				    
				    'NOTIFICA SANITARIA'
				   );

-- TABLE life_event
	insert into life_event (id, description) 
			values ('APERTURA',				    
				    'APERTURA'				    
				   );
	insert into life_event (id, description) 
			values ('TRASFERIMENTO',				    
				    'TRASFERIMENTO DI SEDE'				    
				   );
	insert into life_event (id, description) 
			values ('AMPLIAMENTO',				    
				    'AMPLIAMENTO'				    
				   );
	insert into life_event (id, description) 
			values ('SUBINGRESSO ',				    
				    'SUBINGRESSO'				    
				   );
	insert into life_event (id, description) 
			values ('CESSAZIONE',				    
				    'CESSAZIONE'				    
				   );
	insert into life_event (id, description) 
			values ('SOSPENSIONE',				    
				    'SOSPENSIONE TEMPORANEA'				    
				   );

-- TABLE territorial_scope
	insert into territorial_scope (municipality, istat, "level") 
			values ('ITALIA',				    
				    null,
					'N'					
				   );
	insert into territorial_scope (municipality, istat, "level", fk_parent) 
			values ('REGIONE LIGURIA',				    
				    07,
					'R',
					1
				   );
	insert into territorial_scope (municipality, istat, "level", fk_parent) 
			values ('PROVINCIA SAVONA',				    
				    07009,
					'P',
					2
				   );
	insert into territorial_scope (municipality, istat, "level", fk_parent) 
			values ('COMUNE ALBENGA',				    
				    '07009002',
					'C',
					3
				   );
	insert into territorial_scope (municipality, istat, "level", fk_parent) 
			values ('COMUNE ALASSIO',				    
				    '07009001',
					'C',
					3
				   );
	insert into territorial_scope (municipality, istat, "level", fk_parent) 
			values ('COMUNE ANDORA',				    
				    '07009006',
					'C',
					3
				   );
	
-- TABLE administrative_regime
	insert into administrative_regime (id,"version",description,max_gg_proc,max_gg_admissibility,max_gg_int_resp,max_gg_int_req,max_gg_concl_send) 
			values ('SCIA_001',
					'00.00.00',
					'SCIA',
				    30,
				    5,
				    15,
				    15,
				    25);
	insert into administrative_regime (id,"version",description,max_gg_proc,max_gg_admissibility,max_gg_int_resp,max_gg_int_req,max_gg_concl_send,max_gg_cdss_req) 
			values ('AUTORIZZAZIONE_001',
					'00.00.00',
					'DOMANDA AUTORIZZAZIONE',
				    30,
				    5,
				    15,
				    15,
				    25,
				    20);
	
-- TABLE bo_system	
	insert into bo_system (id, "version", description, e_service_toet, e_service_tofo, e_service_tori, "state", client_id) 
			values ('BO_009002',
					'00.00.00',
					'Back-Office SUAP Comune di Albenga', 
					'jwvh7ox2-0bz7-nl4u-jsn0-tnp68jsx0ssn',
				    'xfyksiqc-21rq-65am-lw5p-d5pausdyy8x9',
				    '4dclgc11-ougr-9or9-uhyi-y4lk8pgwu42s',
				    'Active',
				    '4zs1njxu-klld-fdl6-vvf6-hk2s4bkd9p4t');

	insert into bo_system (id, "version", description, e_service_toet, e_service_tofo, e_service_tori, "state", client_id) 
			values ('BO_009001',
					'00.00.00',
					'Back-Office SUAP Comune di Alassio',
					'xyzh6ox1-0bz7-nl4u-jsn0-tnp68jsx0ssn',
					'faxksiqc-32rq-76am-lw5p-d5pausdyy8x9',
					'3cbmgc22-ougr-9or9-uhyi-y4lk8pgwu42s',
					'Active',
					'3yr2mjxu-klld-fdl6-vvf6-hk2s4bkd9p4t'
					);
					
-- TABLE fo_system	
	insert into fo_system (id, "version", description, e_service_tobo, e_service_tocu,"state", client_id) 
			values ('FO_009002',
					'00.00.00',
					'Front-Office SUAP Comune di Albenga', 
					'7o7ouj93-iff8-s2pz-mbko-25u09djzi462',				    
				    '07awwcme-y65l-t92k-sm3r-kntnf3d95dmo',
				    'Active',
				    'bt10z9a7-tdok-2djw-ycfz-qy90m0wo0440');
	insert into fo_system (id, "version", description, e_service_tobo, e_service_tocu,"state", client_id) 
			values ('FO_009001',
					'00.00.00',
					'Front-Office SUAP Comune di Alassio',
					'6p6ouj82-iff8-s2pz-mbko-25u09djzi462',
					'06bvvcme-y65l-t92k-sm3r-kntnf3d95dmo',
					'Active',
					'as21z9a7-tdok-2djw-ycfz-qy90m0wo0440');
					
-- TABLE single_desk	
	insert into single_desk (id, "version", description, fk_territorial_scope, fk_bo_system, fk_fo_system) 
			values ('SUAP_009002',					
					'00.00.00',
					'SUAP Comune di Albenga', 					
				    4,
				    1,
					1);	
	insert into single_desk (id, "version", description, fk_territorial_scope, fk_bo_system, fk_fo_system) 
			values ('SUAP_009001',
					'00.00.00',
					'SUAP Comune di Alassio',
					5,
					2,
					2);
					
-- TABLE xsd
	insert into xsd (id, "version", description, "name", "status", fk_territorial_scope, object_type) 
			values ('Apertura_Vicinato_001_ITA',
				    '00.00.00',				    
				    'APERTURA ESERCIZIO DI VICINATO 001 NAZIONALE',
				    'apertura_vicinato_001_nazionale.xsd',				    
				    'Active',
				     1,
				    'structured');	
					
-- TABLE schematron
	insert into schematron (id, "version", description, "name", status, fk_territorial_scope, object_type) 
			values ('Apertura_Vicinato_001_ITA',
				    '00.00.00',				    
				    'APERTURA ESERCIZIO DI VICINATO 001 NAZIONALE',
				    'apertura_vicinato_001_nazionale.sch',
				    'Active',
				    1,
				    'structured');						
					
-- TABLE form
	-- ipotesi form strutturata
	insert into form (id, "version", description, fk_schematron, fk_xsd,"name","state",fk_territorial_scope) 
			values ('Apertura_Vicinato_001_ITA',
				    '00.00.00',				    
				    'SEGNALAZIONE CERTIFICATA DI INIZIO ATTIVITÀ PER L’ESERCIZIO DI VICINATO 001 NAZIONALE',
				    1,
				    1,
					'vicinato_001_nazionale.xml',
					'Active',
					1
				   );
				   
	-- ipotesi form non strutturata
	insert into form (id, "version", description, "name","state",fk_territorial_scope) 
			values ('Notifica_sanitaria_001_nazionale',
				    '00.00.00',				    
				    'NOTIFICA AI FINI DELLA REGISTRAZIONE',
					'notifica_sanitaria_001_nazionale.xml',
					'Active',
					1
				   );
				   
    -- ipotesi form non strutturata 
	insert into form (id, "version", description, fk_schematron, fk_xsd,"name","state",fk_territorial_scope) 
			values ('Trasferimento_Vicinato_001_009006',
				    '00.00.00',				    
				    'SEGNALAZIONE CERTIFICATA DI TRASFERIMENTO PER L’ESERCIZIO DI VICINATO 001 COMUNE DI ANDORA',
				    null,
				    null,
					'trasferimento_vicinato_001_009006.xml',
					'Active',
					1
				   );

-- TABLE attachment
	insert into attachment (id, "version", description, fk_schematron, fk_xsd,fk_territorial_scope, "status") 
			values ('COPY_CI',
				    '00.00.00',				    
				    'Copia carta di identità o altro documento equipollente',
				    null,
				    null,
					1,
					'Active'
				   );
				   
-- TABLE proceeding
	insert into proceeding (id,"version", description, fk_typology, fk_life_event, fk_territorial_scope, fk_form, normative_reference, fk_competent_administration_class) 
			values ('APERTURA_VICINATO',				    
				    '00.00.00',
					'APERTURA ESERCIZIO DI VICINATO',
					1,
					1,
					1,
					1,
					'Sez. I, Tabella A, d.lgs. 222/2016',
					1
				   );
	insert into proceeding (id,"version", description, fk_typology, fk_life_event, fk_territorial_scope, fk_form, normative_reference, fk_competent_administration_class)
			values ('NOTIFICA_SANITARIA',				    
				    '00.00.00',
					'NOTIFICA SANITARIA',
					3,
					1,
					1,
					2,
					'ART. 6, REG. CE N. 852/2004',
					2
				   );
	insert into proceeding (id, "version", description, fk_typology, fk_life_event, fk_territorial_scope, fk_form, normative_reference, fk_competent_administration_class) 
			values ('TRASFERIMENTO_VICINATO_009006',
					'00.00.00',
					'TRASFERIMENTO DI SEDE ESERCIZIO DI VICINATO PER COMUNE DI ANDORA',
					1,
					2,
					6,
					3,
					'Sez. I, Tabella A, d.lgs. 222/2016',
					1
					);
				   
	-- TABLE proceeding_attachment
	insert into proceeding_attachment (fk_proceeding, fk_attachment, mandatory) 
			values (1,
					1,
					false					
				   );
	insert into proceeding_attachment (fk_proceeding, fk_attachment, mandatory) 
			values (3,
					1,
					false					
				   );
				   
				   
				   
-- TABLE usecase_proceeding
	insert into usecase_proceeding (id,"version", description, fk_proceeding, schematron_phase, fk_administrative_regime, max_gg_proc,max_gg_admissibility,max_gg_int_resp,max_gg_int_req,max_gg_concl_send,"state") 
			values ('APERTURA_VICINATO_NON_ALIMENTARE',
					'00.00.00',
					'APERTURA ESERCIZIO DI VICINATO NON ALIMENTARE',
					1,
					'non_alimentare',
					1,
					30,
				    5,
				    15,
				    15,
				    25,
					'Active'
				   );
	insert into usecase_proceeding (id,"version", description, fk_proceeding, schematron_phase, fk_administrative_regime, max_gg_proc,max_gg_admissibility,max_gg_int_resp,max_gg_int_req,max_gg_concl_send,"state") 
			values ('APERTURA_VICINATO_ALIMENTARE',
					'00.00.00',
					'APERTURA ESERCIZIO DI VICINATO ALIMENTARE',
					1,
					'alimentare',
					1,
					30,
				    5,
				    15,
				    15,
				    25,
					'Active'
				   );
	insert into usecase_proceeding (id,"version", description, fk_proceeding, fk_administrative_regime, max_gg_proc,max_gg_admissibility,max_gg_int_resp,max_gg_int_req,max_gg_concl_send,"state") 
			values ('NOTIFICA_SANITARIA',
					'00.00.00',
					'NOTIFICA SANITARIA',
					2,					
					1,
					30,
				    5,
				    15,
				    15,
				    25,
					'Active'
				   );

	insert into usecase_proceeding (id,"version", description, fk_proceeding, schematron_phase,fk_administrative_regime, max_gg_proc,max_gg_admissibility,max_gg_int_resp,max_gg_int_req,max_gg_concl_send,"state") 
			values
				('TRASFERIMENTO_VICINATO_NON_ALIMENTARE_009006',
				'00.00.00',
				'TRASFERIMENTO DI SEDE ESERCIZIO DI VICINATO NON ALIMENTARE PER COMUNE DI ANDORA',
				3,
				null,
				1,
				30,
				5,
				15,
				15,
				25,
				'Active'
				);
				
	insert into usecase_proceeding (id,"version", description, fk_proceeding, schematron_phase,fk_administrative_regime, max_gg_proc,max_gg_admissibility,max_gg_int_resp,max_gg_int_req,max_gg_concl_send,"state") 
			values
				('TRASFERIMENTO_VICINATO_ALIMENTARE_009006',
				'00.00.00',
				'TRASFERIMENTO DI SEDE ESERCIZIO DI VICINATO ALIMENTARE PER COMUNE DI ANDORA',
				3,
				null,
				1,
				30,
				5,
				15,
				15,
				25,
				'Active'
				);
				   
-- TABLE endoproceeding
	insert into endoproceeding (fk_primary, fk_secondary, mandatory) 
			values (2,
					3,
					true					
				    );
	insert into endoproceeding (fk_primary, fk_secondary, mandatory) 
			values (1,
					3,
					false);
				   
-- TABLE third_party_system
	insert into third_party_system (id, "version", description, telematic_ref, "state", client_id) 
			values ('ET_009002',
				    '00.00.00',
				    'Sistema ET Ufficio Attività Produttive di Albenga',					
				    '288c53c7-babb-4c12-babb-3d884107a45f',
				    'Active',
				    'rp8mxem4-3348-k9vr-0wc7-3tjdm9b0x4oc');
	insert into third_party_system (id, "version", description, telematic_ref, "state", client_id) 
			values ('Soluzione_Sussidiaria_Nazionale',
				    '00.00.00',
				    'Soluzione Sussidiaria Nazionale Infocamere',				    
				    '63362ead-f496-4a00-8d1e-1073d744a13f',
				    'Active',
				    'j3odcj67-ay31-dyxz-i0s7-xowe87k3j4pz');

-- TABLE competent_administration
	insert into competent_administration (ipacode, office_code, fk_system_entity, "version", description, pec) 
			values ('c_a145',
				    'NNSDDB',
				    1,
				    '00.00.00',
					'Ufficio Attività Produttive di Albenga',
				    'protocollo@pec.comunecambiago.com'
				   );
	insert into competent_administration (ipacode, office_code, fk_system_entity, "version", description, pec) 
			values ('asl_2sav',
					'AA80399',
					2,
					'00.00.00',
					'DISTRETTO SANITARIO ALBENGANESE',
				    'protocollo@pec.asl2.liguria.it'
				   );
	insert into competent_administration (ipacode, office_code, fk_system_entity, "version", description, pec) 
			values ('c_a122',
				    'SSIC',
				    2,
				    '00.00.00',
					'Servizio Imprese e commercio',
				    'comune.alassio@legalmail.it'
				   );
	insert into competent_administration (ipacode, office_code, fk_system_entity, "version", description, pec) 
			values ('c_a278',
				    'UAP',
				    2,
				    '00.00.00',
					'Ufficio Attività produttive',
				    'protocollo@cert.comunediandora.it'
				   );
				   

-- TABLE competent_administration_work
	insert into competent_administration_work (fk_competent_administration, fk_competent_administration_class)
			values (1,
					1
				   );
 	insert into competent_administration_work (fk_competent_administration, fk_competent_administration_class)
			values (
					2,
					2
				   );
	insert into competent_administration_work (fk_competent_administration, fk_competent_administration_class)
			values (
					3,
					1
				   );
	insert into competent_administration_work (fk_competent_administration, fk_competent_administration_class)
			values (
					4,
					1
				   );
				   
				   
-- TABLE competent_administration_territorial_scope
	insert into competent_administration_territorial_scope (fk_competent_administration,fk_territorial_scope)
			values (1,
					4
				   );
	insert into competent_administration_territorial_scope (fk_competent_administration,fk_territorial_scope)
			values (2,
					4
				   );
	insert into competent_administration_territorial_scope (fk_competent_administration,fk_territorial_scope)
			values (2,
					5
				   );
	insert into competent_administration_territorial_scope (fk_competent_administration,fk_territorial_scope)
			values (2,
					6
				   );
	insert into competent_administration_territorial_scope (fk_competent_administration,fk_territorial_scope)
			values (3,
					5
				   );
	insert into competent_administration_territorial_scope (fk_competent_administration,fk_territorial_scope)
			values (4,
					6
				   );
	
				   
