CLASS zgje_transaction_handler DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: go_instance TYPE REF TO zgje_transaction_handler.

    CLASS-METHODS: get_instance RETURNING VALUE(result) TYPE REF TO zgje_transaction_handler.

    TYPES: BEGIN OF ty_temp_key,
             cid TYPE abp_behv_cid,
             pid TYPE abp_behv_pid,
           END OF ty_temp_key,
           tt_temp_key TYPE STANDARD TABLE OF ty_temp_key WITH DEFAULT KEY,
           BEGIN OF ty_final_key,
             cid                 TYPE abp_behv_cid,
             companycode         TYPE bukrs,
             accountingdocument  TYPE belnr_d,
             postingfiscalperiod TYPE gjahr,
           END OF ty_final_key,
           tt_final_key TYPE STANDARD TABLE OF ty_final_key WITH DEFAULT KEY,
           tt_header    TYPE STANDARD TABLE OF zgje_header WITH DEFAULT KEY.
    TYPES: BEGIN OF ty_journalentry,
*           　ヘッダ項目
             companycode                   TYPE zr_generaljournalentry-companycode,
             accountingdocumenttype        TYPE zr_generaljournalentry-accountingdocument,
             ledgergroup                   TYPE zr_generaljournalentry-ledgergroup,
             documentreferenceid           TYPE zr_generaljournalentry-documentreferenceid,
             documentheadertext            TYPE zr_generaljournalentry-documentheadertext,
             documentdate                  TYPE zr_generaljournalentry-documentdate,
             postingdate                   TYPE zr_generaljournalentry-postingdate,
             exchangeratedate              TYPE zr_generaljournalentry-exchangeratedate,
             exchangerate                  TYPE zr_generaljournalentry-exchangerate,
*            明細項目
             referencedocumentitem         TYPE zr_generaljournalentryitem-referencedocumentitem,
             itemtype                      TYPE zr_generaljournalentryitem-itemtype,
             glaccount                     TYPE zr_generaljournalentryitem-glaccount,
             amountintransactioncurrency   TYPE zr_generaljournalentryitem-amountintransactioncurrency,
             taxamount                     TYPE zr_generaljournalentryitem-taxamount,
             currencycode                  TYPE zr_generaljournalentry-currencycode,
             taxcode                       TYPE zr_generaljournalentryitem-taxcode,
             valuedate                     TYPE zr_generaljournalentryitem-valuedate,
             documentitemtext              TYPE zr_generaljournalentryitem-documentitemtext,
             assignmentreference           TYPE zr_generaljournalentryitem-assignmentreference,
             costcenter                    TYPE zr_generaljournalentryitem-costcenter,
             profitcenter                  TYPE zr_generaljournalentryitem-profitcenter,
             wbselement                    TYPE zr_generaljournalentryitem-wbselement,
             orderid                       TYPE zr_generaljournalentryitem-orderid,
             segment                       TYPE zr_generaljournalentryitem-segment,
             functionalarea                TYPE zr_generaljournalentryitem-functionalarea,
             personnelnumber               TYPE zr_generaljournalentryitem-personnelnumber,
             housebank                     TYPE zr_generaljournalentryitem-housebank,
             housebankaccount              TYPE zr_generaljournalentryitem-housebankaccount,
             reference1idbybusinesspartner TYPE zr_generaljournalentryitem-reference1idbybusinesspartner,
             reference2idbybusinesspartner TYPE zr_generaljournalentryitem-reference2idbybusinesspartner,
             reference3idbybusinesspartner TYPE zr_generaljournalentryitem-reference3idbybusinesspartner,
             customer_copa                 TYPE zr_generaljournalentryitem-customer_copa,
             customergroup_copa            TYPE zr_generaljournalentryitem-customergroup_copa,
             customerindustry_copa         TYPE zr_generaljournalentryitem-customerindustry_copa,
             customercountry_copa          TYPE zr_generaljournalentryitem-customercountry_copa,
             salesdistrict_copa            TYPE zr_generaljournalentryitem-salesdistrict_copa,
             soldmaterial_copa             TYPE zr_generaljournalentryitem-soldmaterial_copa,
             soldmaterialgroup_copa        TYPE zr_generaljournalentryitem-soldmaterialgroup_copa,
             salesorganization_copa        TYPE zr_generaljournalentryitem-salesorganization_copa,
             distributionchannel_copa      TYPE zr_generaljournalentryitem-distributionchannel_copa,
             wbselement_copa               TYPE zr_generaljournalentryitem-wbselement_copa,
             functionalarea_copa           TYPE zr_generaljournalentryitem-functionalarea_copa,
             salesorder_copa               TYPE zr_generaljournalentryitem-salesorder_copa,
             salesorderitem_copa           TYPE zr_generaljournalentryitem-salesorderitem_copa,
             plant_copa                    TYPE zr_generaljournalentryitem-plant_copa,
             costcenter_copa               TYPE zr_generaljournalentryitem-costcenter_copa,
             profitcenter_copa             TYPE zr_generaljournalentryitem-profitcenter_copa,
             customer                      TYPE zr_generaljournalentryitem-customer,
             duecalculationbasedate        TYPE zr_generaljournalentryitem-duecalculationbasedate,
             cashdiscount1days             TYPE zr_generaljournalentryitem-cashdiscount1days,
             cashdiscount1percent          TYPE zr_generaljournalentryitem-cashdiscount1percent,
             cashdiscount2days             TYPE zr_generaljournalentryitem-cashdiscount2days,
             cashdiscount2percent          TYPE zr_generaljournalentryitem-cashdiscount2percent,
             paymentterms                  TYPE zr_generaljournalentryitem-paymentterms,
             paymentmethod                 TYPE zr_generaljournalentryitem-paymentmethod,
             paymentblockingreason         TYPE zr_generaljournalentryitem-paymentblockingreason,
             statecentralbankpaymentreason TYPE zr_generaljournalentryitem-statecentralbankpaymentreason,
             specialglcode                 TYPE zr_generaljournalentryitem-specialglcode,
             supplier                      TYPE zr_generaljournalentryitem-supplier,
             bpbankaccountinternalid       TYPE zr_generaljournalentryitem-bpbankaccountinternalid,
             name_onetime                  TYPE zr_generaljournalentryitem-name_onetime,
             name3_onetime                 TYPE zr_generaljournalentryitem-name3_onetime,
             cityname_onetime              TYPE zr_generaljournalentryitem-cityname_onetime,
             bankcountry_onetime           TYPE zr_generaljournalentryitem-bankcountry_onetime,
             bankaccount_onetime           TYPE zr_generaljournalentryitem-bankaccount_onetime,
             bankcontrolkey_onetime        TYPE zr_generaljournalentryitem-bankcontrolkey_onetime,
             banknumber_onetime            TYPE zr_generaljournalentryitem-banknumber_onetime,
             datamediumexchangekey_onetime TYPE zr_generaljournalentryitem-datamediumexchangekey_onetime,
             languageisocode_onetime       TYPE zr_generaljournalentryitem-languageisocode_onetime,
             withholdingtaxtype            TYPE zr_generaljournalentryitem-withholdingtaxtype,
             withholdingtaxcode            TYPE zr_generaljournalentryitem-withholdingtaxcode,
           END OF ty_journalentry.
    TYPES: BEGIN OF ty_journalentry_header,
*           　ヘッダ項目
             companycode                   TYPE string,
             accountingdocumenttype        TYPE string,
             ledgergroup                   TYPE string,
             documentreferenceid           TYPE string,
             documentheadertext            TYPE string,
             documentdate                  TYPE string,
             postingdate                   TYPE string,
             exchangeratedate              TYPE string,
             exchangerate                  TYPE string,
*            明細項目
             referencedocumentitem         TYPE string,
             itemtype                      TYPE string,
             glaccount                     TYPE string,
             amountintransactioncurrency   TYPE string,
             taxamount                     TYPE string,
             currencycode                  TYPE string,
             taxcode                       TYPE string,
             valuedate                     TYPE string,
             documentitemtext              TYPE string,
             assignmentreference           TYPE string,
             costcenter                    TYPE string,
             profitcenter                  TYPE string,
             wbselement                    TYPE string,
             orderid                       TYPE string,
             segment                       TYPE string,
             functionalarea                TYPE string,
             personnelnumber               TYPE string,
             housebank                     TYPE string,
             housebankaccount              TYPE string,
             reference1idbybusinesspartner TYPE string,
             reference2idbybusinesspartner TYPE string,
             reference3idbybusinesspartner TYPE string,
             customer_copa                 TYPE string,
             customergroup_copa            TYPE string,
             customerindustry_copa         TYPE string,
             customercountry_copa          TYPE string,
             salesdistrict_copa            TYPE string,
             soldmaterial_copa             TYPE string,
             soldmaterialgroup_copa        TYPE string,
             salesorganization_copa        TYPE string,
             distributionchannel_copa      TYPE string,
             wbselement_copa               TYPE string,
             functionalarea_copa           TYPE string,
             salesorder_copa               TYPE string,
             salesorderitem_copa           TYPE string,
             plant_copa                    TYPE string,
             costcenter_copa               TYPE string,
             profitcenter_copa             TYPE string,
             customer                      TYPE string,
             duecalculationbasedate        TYPE string,
             cashdiscount1days             TYPE string,
             cashdiscount1percent          TYPE string,
             cashdiscount2days             TYPE string,
             cashdiscount2percent          TYPE string,
             paymentterms                  TYPE string,
             paymentmethod                 TYPE string,
             paymentblockingreason         TYPE string,
             statecentralbankpaymentreason TYPE string,
             specialglcode                 TYPE string,
             supplier                      TYPE string,
             bpbankaccountinternalid       TYPE string,
             name_onetime                  TYPE string,
             name3_onetime                 TYPE string,
             cityname_onetime              TYPE string,
             bankcountry_onetime           TYPE string,
             bankaccount_onetime           TYPE string,
             bankcontrolkey_onetime        TYPE string,
             banknumber_onetime            TYPE string,
             datamediumexchangekey_onetime TYPE string,
             languageisocode_onetime       TYPE string,
             withholdingtaxtype            TYPE string,
             withholdingtaxcode            TYPE string,
           END OF ty_journalentry_header.
    TYPES: BEGIN OF ty_journalentry_result,
*           　ヘッダ項目
             companycode                   TYPE zr_generaljournalentry-companycode,
             accountingdocumenttype        TYPE zr_generaljournalentry-accountingdocument,
             documentreferenceid           TYPE zr_generaljournalentry-documentreferenceid,
             ledgergroup                   TYPE zr_generaljournalentry-ledgergroup,
             documentheadertext            TYPE zr_generaljournalentry-documentheadertext,
             documentdate                  TYPE zr_generaljournalentry-documentdate,
             postingdate                   TYPE zr_generaljournalentry-postingdate,
             exchangeratedate              TYPE zr_generaljournalentry-exchangeratedate,
             exchangerate                  TYPE zr_generaljournalentry-exchangerate,
*            明細項目
             referencedocumentitem         TYPE zr_generaljournalentryitem-referencedocumentitem,
             itemtype                      TYPE zr_generaljournalentryitem-itemtype,
             glaccount                     TYPE zr_generaljournalentryitem-glaccount,
             amountintransactioncurrency   TYPE zr_generaljournalentryitem-amountintransactioncurrency,
             taxamount                     TYPE zr_generaljournalentryitem-taxamount,
             currencycode                  TYPE zr_generaljournalentry-currencycode,
             taxcode                       TYPE zr_generaljournalentryitem-taxcode,
             valuedate                     TYPE zr_generaljournalentryitem-valuedate,
             documentitemtext              TYPE zr_generaljournalentryitem-documentitemtext,
             assignmentreference           TYPE zr_generaljournalentryitem-assignmentreference,
             costcenter                    TYPE zr_generaljournalentryitem-costcenter,
             profitcenter                  TYPE zr_generaljournalentryitem-profitcenter,
             wbselement                    TYPE zr_generaljournalentryitem-wbselement,
             orderid                       TYPE zr_generaljournalentryitem-orderid,
             segment                       TYPE zr_generaljournalentryitem-segment,
             functionalarea                TYPE zr_generaljournalentryitem-functionalarea,
             personnelnumber               TYPE zr_generaljournalentryitem-personnelnumber,
             housebank                     TYPE zr_generaljournalentryitem-housebank,
             housebankaccount              TYPE zr_generaljournalentryitem-housebankaccount,
             reference1idbybusinesspartner TYPE zr_generaljournalentryitem-reference1idbybusinesspartner,
             reference2idbybusinesspartner TYPE zr_generaljournalentryitem-reference2idbybusinesspartner,
             reference3idbybusinesspartner TYPE zr_generaljournalentryitem-reference3idbybusinesspartner,
             customer_copa                 TYPE zr_generaljournalentryitem-customer_copa,
             customergroup_copa            TYPE zr_generaljournalentryitem-customergroup_copa,
             customerindustry_copa         TYPE zr_generaljournalentryitem-customerindustry_copa,
             customercountry_copa          TYPE zr_generaljournalentryitem-customercountry_copa,
             salesdistrict_copa            TYPE zr_generaljournalentryitem-salesdistrict_copa,
             soldmaterial_copa             TYPE zr_generaljournalentryitem-soldmaterial_copa,
             soldmaterialgroup_copa        TYPE zr_generaljournalentryitem-soldmaterialgroup_copa,
             salesorganization_copa        TYPE zr_generaljournalentryitem-salesorganization_copa,
             distributionchannel_copa      TYPE zr_generaljournalentryitem-distributionchannel_copa,
             wbselement_copa               TYPE zr_generaljournalentryitem-wbselement_copa,
             functionalarea_copa           TYPE zr_generaljournalentryitem-functionalarea_copa,
             salesorder_copa               TYPE zr_generaljournalentryitem-salesorder_copa,
             salesorderitem_copa           TYPE zr_generaljournalentryitem-salesorderitem_copa,
             plant_copa                    TYPE zr_generaljournalentryitem-plant_copa,
             costcenter_copa               TYPE zr_generaljournalentryitem-costcenter_copa,
             profitcenter_copa             TYPE zr_generaljournalentryitem-profitcenter_copa,
             customer                      TYPE zr_generaljournalentryitem-customer,
             duecalculationbasedate        TYPE zr_generaljournalentryitem-duecalculationbasedate,
             cashdiscount1days             TYPE zr_generaljournalentryitem-cashdiscount1days,
             cashdiscount1percent          TYPE zr_generaljournalentryitem-cashdiscount1percent,
             cashdiscount2days             TYPE zr_generaljournalentryitem-cashdiscount2days,
             cashdiscount2percent          TYPE zr_generaljournalentryitem-cashdiscount2percent,
             paymentterms                  TYPE zr_generaljournalentryitem-paymentterms,
             paymentmethod                 TYPE zr_generaljournalentryitem-paymentmethod,
             paymentblockingreason         TYPE zr_generaljournalentryitem-paymentblockingreason,
             statecentralbankpaymentreason TYPE zr_generaljournalentryitem-statecentralbankpaymentreason,
             specialglcode                 TYPE zr_generaljournalentryitem-specialglcode,
             supplier                      TYPE zr_generaljournalentryitem-supplier,
             bpbankaccountinternalid       TYPE zr_generaljournalentryitem-bpbankaccountinternalid,
             name_onetime                  TYPE zr_generaljournalentryitem-name_onetime,
             name3_onetime                 TYPE zr_generaljournalentryitem-name3_onetime,
             cityname_onetime              TYPE zr_generaljournalentryitem-cityname_onetime,
             bankcountry_onetime           TYPE zr_generaljournalentryitem-bankcountry_onetime,
             bankaccount_onetime           TYPE zr_generaljournalentryitem-bankaccount_onetime,
             bankcontrolkey_onetime        TYPE zr_generaljournalentryitem-bankcontrolkey_onetime,
             banknumber_onetime            TYPE zr_generaljournalentryitem-banknumber_onetime,
             datamediumexchangekey_onetime TYPE zr_generaljournalentryitem-datamediumexchangekey_onetime,
             languageisocode_onetime       TYPE zr_generaljournalentryitem-languageisocode_onetime,
             withholdingtaxtype            TYPE zr_generaljournalentryitem-withholdingtaxtype,
             withholdingtaxcode            TYPE zr_generaljournalentryitem-withholdingtaxcode,
             uuid                          TYPE uuid,
             messageid                     TYPE symsgid,
             messageno                     TYPE symsgno,
             message                       TYPE string,
           END OF ty_journalentry_result.
    TYPES: BEGIN OF ty_journalentry_header_result,
*           　ヘッダ項目
             companycode                   TYPE string,
             accountingdocumenttype        TYPE string,
             documentreferenceid           TYPE string,
             ledgergroup                   TYPE string,
             documentheadertext            TYPE string,
             documentdate                  TYPE string,
             postingdate                   TYPE string,
             exchangeratedate              TYPE string,
             exchangerate                  TYPE string,
*            明細項目
             referencedocumentitem         TYPE string,
             itemtype                      TYPE string,
             glaccount                     TYPE string,
             amountintransactioncurrency   TYPE string,
             taxamount                     TYPE string,
             currencycode                  TYPE string,
             taxcode                       TYPE string,
             valuedate                     TYPE string,
             documentitemtext              TYPE string,
             assignmentreference           TYPE string,
             costcenter                    TYPE string,
             profitcenter                  TYPE string,
             wbselement                    TYPE string,
             orderid                       TYPE string,
             segment                       TYPE string,
             functionalarea                TYPE string,
             personnelnumber               TYPE string,
             housebank                     TYPE string,
             housebankaccount              TYPE string,
             reference1idbybusinesspartner TYPE string,
             reference2idbybusinesspartner TYPE string,
             reference3idbybusinesspartner TYPE string,
             customer_copa                 TYPE string,
             customergroup_copa            TYPE string,
             customerindustry_copa         TYPE string,
             customercountry_copa          TYPE string,
             salesdistrict_copa            TYPE string,
             soldmaterial_copa             TYPE string,
             soldmaterialgroup_copa        TYPE string,
             salesorganization_copa        TYPE string,
             distributionchannel_copa      TYPE string,
             wbselement_copa               TYPE string,
             functionalarea_copa           TYPE string,
             salesorder_copa               TYPE string,
             salesorderitem_copa           TYPE string,
             plant_copa                    TYPE string,
             costcenter_copa               TYPE string,
             profitcenter_copa             TYPE string,
             customer                      TYPE string,
             duecalculationbasedate        TYPE string,
             cashdiscount1days             TYPE string,
             cashdiscount1percent          TYPE string,
             cashdiscount2days             TYPE string,
             cashdiscount2percent          TYPE string,
             paymentterms                  TYPE string,
             paymentmethod                 TYPE string,
             paymentblockingreason         TYPE string,
             statecentralbankpaymentreason TYPE string,
             specialglcode                 TYPE string,
             supplier                      TYPE string,
             bpbankaccountinternalid       TYPE string,
             name_onetime                  TYPE string,
             name3_onetime                 TYPE string,
             cityname_onetime              TYPE string,
             bankcountry_onetime           TYPE string,
             bankaccount_onetime           TYPE string,
             bankcontrolkey_onetime        TYPE string,
             banknumber_onetime            TYPE string,
             datamediumexchangekey_onetime TYPE string,
             languageisocode_onetime       TYPE string,
             withholdingtaxtype            TYPE string,
             withholdingtaxcode            TYPE string,
             uuid                          TYPE string,
             messageid                     TYPE string,
             messageno                     TYPE string,
             message                       TYPE string,
           END OF ty_journalentry_header_result,
           tt_journalentry        TYPE STANDARD TABLE OF ty_journalentry WITH DEFAULT KEY,
           tt_journalentry_result TYPE STANDARD TABLE OF ty_journalentry_result WITH DEFAULT KEY.


    DATA: temp_key        TYPE tt_temp_key,
          gt_journalentry TYPE STANDARD TABLE OF ty_journalentry_result.


    METHODS: set_temp_key IMPORTING it_temp_key TYPE tt_temp_key,
      get_temp_key RETURNING VALUE(result) TYPE tt_temp_key,
      convert_temp_to_final RETURNING VALUE(result) TYPE tt_final_key,
      additional_save IMPORTING it_create TYPE tt_header
                                it_delete TYPE tt_header,
      clean_up,
      set_inputdata IMPORTING it_journalentry TYPE tt_journalentry,
      get_inputdata RETURNING VALUE(result) TYPE tt_journalentry_result,
      set_message IMPORTING iv_uuid      TYPE uuid
                            iv_messageid TYPE symsgid
                            iv_messageno TYPE symsgno
                            iv_message   TYPE char255,
      set_uuid IMPORTING iv_index TYPE int4
                         iv_uuid  TYPE uuid,
      output_result RETURNING VALUE(result) TYPE tt_journalentry_result.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zgje_transaction_handler IMPLEMENTATION.
  METHOD get_instance.
    IF go_instance IS NOT BOUND.
      go_instance = NEW #( ).
    ENDIF.
    result = go_instance.
  ENDMETHOD.

  METHOD additional_save.

    DATA: lt_create TYPE TABLE OF zgje_header.

    DATA(lt_je_key) = convert_temp_to_final(  ).

    LOOP AT it_create INTO DATA(ls_create).
      READ TABLE lt_je_key INTO DATA(ls_je_key) WITH KEY cid = ls_create-uuid.
      IF sy-subrc = 0.
        ls_create-accountingdocument = ls_je_key-accountingdocument.
        APPEND ls_create TO lt_create.
      ENDIF.
    ENDLOOP.

    IF lt_create IS NOT INITIAL.
      INSERT zgje_header FROM TABLE @lt_create.
    ENDIF.

    IF it_delete IS NOT INITIAL.
      DELETE zgje_header FROM TABLE @it_delete.
    ENDIF.

  ENDMETHOD.

  METHOD clean_up.
    CLEAR temp_key.
  ENDMETHOD.

  METHOD convert_temp_to_final.
    DATA: ls_final_key TYPE ty_final_key.
    IF temp_key IS NOT INITIAL.
      LOOP AT temp_key INTO DATA(ls_temp_key).
        CONVERT KEY OF i_journalentrytp
          FROM ls_temp_key-pid
          TO FINAL(lv_root_key).

        ls_final_key-cid = ls_temp_key-cid.
        ls_final_key-companycode = lv_root_key-companycode.
        ls_final_key-accountingdocument = lv_root_key-accountingdocument.
        ls_final_key-postingfiscalperiod = lv_root_key-fiscalyear.

        APPEND ls_final_key TO result.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD set_temp_key.
    temp_key = it_temp_key.
  ENDMETHOD.

  METHOD get_temp_key.
    result = temp_key.
  ENDMETHOD.

  METHOD set_inputdata.
    gt_journalentry = CORRESPONDING #( it_journalentry ).
  ENDMETHOD.

  METHOD get_inputdata.
    result = gt_journalentry.
  ENDMETHOD.

  METHOD set_message.
    LOOP AT gt_journalentry ASSIGNING FIELD-SYMBOL(<fs_journalentry>) WHERE uuid = iv_uuid.
      <fs_journalentry>-messageid = iv_messageid.
      <fs_journalentry>-messageno = iv_messageno.
      <fs_journalentry>-message = iv_message.
    ENDLOOP.
  ENDMETHOD.

  METHOD set_uuid.
    gt_journalentry[ iv_index ]-uuid = iv_uuid.
  ENDMETHOD.

  METHOD output_result.
    result = gt_journalentry.
  ENDMETHOD.
ENDCLASS.
