CLASS lhc_zr_generaljournalentry DEFINITION INHERITING FROM cl_abap_behavior_handler.
*  PUBLIC SECTION.
*   class-METHODS outputresult_test
*      returning value(output) type ZI_FILE_ABS.
  PRIVATE SECTION.
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
           END OF ty_journalentry_header_result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zr_generaljournalentry RESULT result.

    METHODS post FOR DETERMINE ON SAVE
      IMPORTING keys FOR zr_generaljournalentry~post.

    METHODS fileupload FOR MODIFY
      IMPORTING keys FOR ACTION zr_generaljournalentry~fileupload.

    METHODS downloadfile FOR MODIFY
      IMPORTING keys FOR ACTION zr_generaljournalentry~downloadfile RESULT result.

    METHODS outputresult FOR MODIFY
      IMPORTING keys FOR ACTION zr_generaljournalentry~outputresult RESULT result.

    METHODS convert_price IMPORTING i_price        TYPE ty_journalentry-amountintransactioncurrency
                                    i_currency     TYPE ty_journalentry-currencycode
                          RETURNING VALUE(r_price) TYPE ty_journalentry-amountintransactioncurrency.

ENDCLASS.

CLASS lhc_zr_generaljournalentry IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD post.

    DATA: lt_entry          TYPE TABLE FOR ACTION IMPORT i_journalentrytp~post,
          lt_entry_check    TYPE TABLE FOR FUNCTION IMPORT i_journalentrytp~validate,
          ls_entry          LIKE LINE OF lt_entry,
          ls_glitem         LIKE LINE OF ls_entry-%param-_glitems,
          ls_amount         LIKE LINE OF ls_glitem-_currencyamount,
          ls_copa           LIKE ls_glitem-_profitabilitysupplement,
          ls_aritem         LIKE LINE OF ls_entry-%param-_aritems,
          ls_apitem         LIKE LINE OF ls_entry-%param-_apitems,
          ls_taxitem        LIKE LINE OF ls_entry-%param-_taxitems,
          ls_onetime        LIKE ls_entry-%param-_onetimecustomersupplier,
          ls_holdingtaxitem LIKE LINE OF ls_entry-%param-_withholdingtaxitems,
          lt_temp_key       TYPE zgje_transaction_handler=>tt_temp_key,
          ls_temp_key       LIKE LINE OF lt_temp_key.

    READ ENTITIES OF zr_generaljournalentry IN LOCAL MODE
        ENTITY zr_generaljournalentry ALL FIELDS WITH CORRESPONDING #( keys ) RESULT FINAL(header)
        ENTITY zr_generaljournalentry BY \_item ALL FIELDS WITH CORRESPONDING #( keys ) RESULT FINAL(item).

    DATA(lv_itemindex) = 1.

    "start to call I_JournalEntryTP~Post
    LOOP AT header REFERENCE INTO DATA(ls_header).
      CLEAR ls_entry.
      ls_entry-%cid = ls_header->uuid. "use UUID as CID
      ls_entry-%param-companycode = ls_header->companycode.
      ls_entry-%param-businesstransactiontype = 'RFBU'.
      ls_entry-%param-accountingdocumenttype = ls_header->accountingdocumenttype.
      ls_entry-%param-ledgergroup = ls_header->ledgergroup.
      ls_entry-%param-accountingdocumentheadertext = ls_header->documentheadertext.
      ls_entry-%param-documentreferenceid = ls_header->documentreferenceid.
      ls_entry-%param-documentdate = ls_header->documentdate.
      ls_entry-%param-postingdate = ls_header->postingdate.
      ls_entry-%param-taxdeterminationdate = ls_header->postingdate.
      ls_entry-%param-exchangeratedate = ls_header->exchangeratedate.
*      ls_entry-%param-exchangerate = ls_header->exchangerate.
      ls_entry-%param-createdbyuser = ls_header->created_by.

      LOOP AT item REFERENCE INTO DATA(ls_item) USING KEY entity WHERE uuid = ls_header->uuid.

        zgje_transaction_handler=>get_instance( )->set_uuid( iv_index = lv_itemindex
                                                             iv_uuid = ls_header->uuid ).
        lv_itemindex += 1.

        CLEAR ls_glitem.
        CASE ls_item->%data-itemtype.
          WHEN 'GL'.
            ls_glitem-glaccountlineitem = ls_item->%data-referencedocumentitem.
            ls_glitem-glaccount         = ls_item->%data-glaccount.
            ls_glitem-documentitemtext       = ls_item->%data-documentitemtext.
            ls_glitem-assignmentreference = ls_item->%data-assignmentreference.
            ls_glitem-taxcode       = ls_item->%data-taxcode.
            ls_glitem-valuedate       = ls_item->%data-valuedate.
            ls_glitem-costcenter        = ls_item->%data-costcenter.
            ls_glitem-profitcenter        = ls_item->%data-profitcenter.
            ls_glitem-wbselement = ls_item->%data-wbselement.
            ls_glitem-orderid = ls_item->%data-orderid.
            ls_glitem-segment = ls_item->%data-segment.
            ls_glitem-functionalarea = ls_item->%data-functionalarea.
            ls_glitem-personnelnumber = ls_item->%data-personnelnumber.
            ls_glitem-housebank = ls_item->%data-housebank.
            ls_glitem-housebankaccount = ls_item->%data-housebankaccount.
            ls_glitem-reference1idbybusinesspartner = ls_item->%data-reference1idbybusinesspartner.
            ls_glitem-reference2idbybusinesspartner = ls_item->%data-reference2idbybusinesspartner.
            ls_glitem-reference3idbybusinesspartner = ls_item->%data-reference3idbybusinesspartner.

**********************************************************************
*            CLEAR: ls_onetime.
*            ls_onetime-name = 'name'.
*            ls_onetime-onetimebusinesspartnername3 = 'name3'.
*            ls_onetime-cityname = 'cityname'.
*            ls_onetime-bankaccount = 'JPAC1'.
*            ls_onetime-bankcontrolkey = ''.
*            ls_onetime-banknumber = ''.
*            ls_onetime-datamediumexchangekey = ''.
*            ls_onetime-languageisocode = ''.
*
*            ls_entry-%param-_onetimecustomersupplier = ls_onetime.

**********************************************************************
            IF ls_item->%data-taxcode IS NOT INITIAL.
              CLEAR ls_taxitem.
*              ls_taxitem-glaccountlineitem = ls_item->%data-referencedocumentitem.
              ls_taxitem-taxcode = ls_item->%data-taxcode.
              SELECT SINGLE taxtype
                FROM i_taxcode
                WHERE taxcode = @ls_item->%data-taxcode
                INTO @DATA(lv_taxtype).
              IF lv_taxtype = 'A'.
                ls_taxitem-conditiontype = 'MWAR'.
              ELSE.
                ls_taxitem-conditiontype = 'MWVR'.
              ENDIF.
*              ls_taxitem-TaxItemClassification = 'MWS'.

              CLEAR ls_amount.
              ls_amount-currencyrole = '00'.
              ls_amount-currency = ls_header->currencycode.
              ls_amount-journalentryitemamount = ls_item->%data-taxamount.
              ls_amount-taxamount = ls_item->%data-taxamount.
              ls_amount-taxbaseamount = ls_item->%data-amountintransactioncurrency.

              APPEND ls_amount TO ls_taxitem-_currencyamount.
              APPEND ls_taxitem TO ls_entry-%param-_taxitems.
            ENDIF.
**********************************************************************
            CLEAR ls_amount.
            ls_amount-currencyrole = '00'.
            ls_amount-currency = ls_header->currencycode.
            ls_amount-journalentryitemamount = ls_item->%data-amountintransactioncurrency.
            IF ls_item->%data-taxcode IS NOT INITIAL.
              ls_amount-taxamount = ls_item->%data-taxamount.
              ls_amount-taxbaseamount = ls_item->%data-amountintransactioncurrency.
            ENDIF.
            APPEND ls_amount TO ls_glitem-_currencyamount.

            CLEAR ls_copa.
            ls_copa-customer = ls_item->%data-customer_copa.
            ls_copa-customergroup = ls_item->%data-customergroup_copa.
            ls_copa-customersupplierindustry = ls_item->%data-customerindustry_copa.
            ls_copa-customersuppliercountry = ls_item->%data-customercountry_copa.
            ls_copa-salesdistrict = ls_item->%data-salesdistrict_copa.
            ls_copa-soldproduct = ls_item->%data-soldmaterial_copa.
            ls_copa-soldproductgroup = ls_item->%data-soldmaterialgroup_copa.
            ls_copa-salesorganization = ls_item->%data-salesorganization_copa.
            ls_copa-distributionchannel = ls_item->%data-distributionchannel_copa.
            ls_copa-wbselement = ls_item->%data-wbselement_copa.
            ls_copa-functionalarea = ls_item->%data-functionalarea_copa.
            ls_copa-salesorder = ls_item->%data-salesorder_copa.
            ls_copa-salesorderitem = ls_item->%data-salesorderitem_copa.
            ls_copa-plant = ls_item->%data-plant_copa.
            ls_copa-costcenter = ls_item->%data-costcenter_copa.
            ls_copa-profitcenter = ls_item->%data-profitcenter_copa.
            ls_glitem-_profitabilitysupplement = ls_copa.

            APPEND ls_glitem TO ls_entry-%param-_glitems.
          WHEN 'AR'.
            CLEAR ls_aritem.
            ls_aritem-glaccountlineitem = ls_item->%data-referencedocumentitem.
            ls_aritem-customer = ls_item->%data-customer.
            ls_aritem-glaccount         = ls_item->%data-glaccount.
            ls_aritem-documentitemtext       = ls_item->%data-documentitemtext.
            ls_aritem-reference1idbybusinesspartner = ls_item->%data-reference1idbybusinesspartner.
            ls_aritem-reference2idbybusinesspartner = ls_item->%data-reference2idbybusinesspartner.
            ls_aritem-reference3idbybusinesspartner = ls_item->%data-reference3idbybusinesspartner.
            ls_aritem-duecalculationbasedate = ls_item->%data-duecalculationbasedate.
            ls_aritem-cashdiscount1days = ls_item->%data-cashdiscount1days.
            ls_aritem-cashdiscount1percent = ls_item->%data-cashdiscount1percent.
            ls_aritem-cashdiscount2days = ls_item->%data-cashdiscount2days.
            ls_aritem-cashdiscount2percent = ls_item->%data-cashdiscount2percent.
            ls_aritem-paymentterms = ls_item->%data-paymentterms.
            ls_aritem-paymentmethod = ls_item->%data-paymentmethod.
            ls_aritem-paymentblockingreason = ls_item->%data-paymentblockingreason.
            ls_aritem-statecentralbankpaymentreason = ls_item->%data-statecentralbankpaymentreason.
            ls_aritem-housebank = ls_item->%data-housebank.
            ls_aritem-housebankaccount = ls_item->%data-housebankaccount.
            ls_aritem-specialglcode = ls_item->%data-specialglcode.
            ls_aritem-housebank = ls_item->%data-housebank.
            ls_aritem-housebankaccount = ls_item->%data-housebankaccount.
            ls_aritem-taxcode       = ls_item->%data-taxcode.

**********************************************************************
            CLEAR: ls_onetime.
            ls_onetime-name = ls_item->%data-name_onetime.
            ls_onetime-onetimebusinesspartnername3 = ls_item->%data-name3_onetime.
            ls_onetime-cityname = ls_item->%data-cityname_onetime.
            ls_onetime-bankcountry = ls_item->%data-bankcountry_onetime.
            ls_onetime-bankaccount = ls_item->%data-bankaccount_onetime.
            ls_onetime-bankcontrolkey = ls_item->%data-bankcontrolkey_onetime.
            ls_onetime-banknumber = ls_item->%data-banknumber_onetime.
            ls_onetime-datamediumexchangekey = ls_item->%data-datamediumexchangekey_onetime.
            ls_onetime-languageisocode = ls_item->%data-languageisocode_onetime..

            ls_entry-%param-_onetimecustomersupplier = ls_onetime.

**********************************************************************

            CLEAR ls_amount.
            ls_amount-currencyrole = '00'.
            ls_amount-currency = ls_header->currencycode.
            ls_amount-journalentryitemamount = ls_item->%data-amountintransactioncurrency.
            IF ls_item->%data-taxcode IS NOT INITIAL.
              ls_amount-taxamount = 0.
              ls_amount-taxbaseamount = ls_item->%data-amountintransactioncurrency.
            ENDIF.
            APPEND ls_amount TO ls_aritem-_currencyamount.

            APPEND ls_aritem TO ls_entry-%param-_aritems.

          WHEN 'AP'.
            CLEAR ls_apitem.
            ls_apitem-glaccountlineitem = ls_item->%data-referencedocumentitem.
            ls_apitem-supplier = ls_item->%data-supplier.
            ls_apitem-glaccount         = ls_item->%data-glaccount.
            ls_apitem-documentitemtext       = ls_item->%data-documentitemtext.
            ls_apitem-reference1idbybusinesspartner = ls_item->%data-reference1idbybusinesspartner.
            ls_apitem-reference2idbybusinesspartner = ls_item->%data-reference2idbybusinesspartner.
            ls_apitem-reference3idbybusinesspartner = ls_item->%data-reference3idbybusinesspartner.
            ls_apitem-paymentterms = ls_item->%data-paymentterms.
            ls_apitem-duecalculationbasedate = ls_item->%data-duecalculationbasedate.
            ls_apitem-cashdiscount1days = ls_item->%data-cashdiscount1days.
            ls_apitem-cashdiscount1percent = ls_item->%data-cashdiscount1percent.
            ls_apitem-cashdiscount2days = ls_item->%data-cashdiscount2days.
            ls_apitem-cashdiscount2percent = ls_item->%data-cashdiscount2percent.
            ls_apitem-paymentmethod = ls_item->%data-paymentmethod.
            ls_apitem-paymentblockingreason = ls_item->%data-paymentblockingreason.
            ls_apitem-bpbankaccountinternalid = ls_item->%data-bpbankaccountinternalid.
            ls_apitem-statecentralbankpaymentreason = ls_item->%data-statecentralbankpaymentreason.
            ls_apitem-housebank = ls_item->%data-housebank.
            ls_apitem-housebankaccount = ls_item->%data-housebankaccount.
            ls_apitem-specialglcode = ls_item->%data-specialglcode.
            ls_apitem-housebank = ls_item->%data-housebank.
            ls_apitem-housebankaccount = ls_item->%data-housebankaccount.
            ls_apitem-taxcode       = ls_item->%data-taxcode.
            ls_apitem-wbselement = ls_item->%data-wbselement.

**********************************************************************
            CLEAR: ls_onetime.
            ls_onetime-name = ls_item->%data-name_onetime.
            ls_onetime-onetimebusinesspartnername3 = ls_item->%data-name3_onetime.
            ls_onetime-cityname = ls_item->%data-cityname_onetime.
            ls_onetime-bankcountry = ls_item->%data-bankcountry_onetime.
            ls_onetime-bankaccount = ls_item->%data-bankaccount_onetime.
            ls_onetime-bankcontrolkey = ls_item->%data-bankcontrolkey_onetime.
            ls_onetime-banknumber = ls_item->%data-banknumber_onetime.
            ls_onetime-datamediumexchangekey = ls_item->%data-datamediumexchangekey_onetime.
            ls_onetime-languageisocode = ls_item->%data-languageisocode_onetime..

            ls_entry-%param-_onetimecustomersupplier = ls_onetime.

**********************************************************************
            IF ls_item->%data-withholdingtaxtype IS NOT INITIAL AND
               ls_item->%data-withholdingtaxcode IS NOT INITIAL.
              CLEAR ls_holdingtaxitem.
              ls_holdingtaxitem-glaccountlineitem = ls_item->%data-referencedocumentitem.
              ls_holdingtaxitem-withholdingtaxtype = ls_item->%data-withholdingtaxtype.
              ls_holdingtaxitem-withholdingtaxcode = ls_item->%data-withholdingtaxcode.
*            ls_holdingtaxitem-WhldgTaxBaseIsEnteredManually = 'X'.
*            ls_holdingtaxitem-WhldgTaxIsEnteredManually = 'X'.
*            CLEAR ls_amount.
*              ls_amount-currencyrole = '00'.
*              ls_amount-currency = ls_header->currencycode.
**              ls_amount-journalentryitemamount = '10.21-'.
**              ls_amount-taxamount = '10.21-'.
**              ls_amount-taxbaseamount = '100.00-'.
**              ls_amount-CashDiscountBaseAmount = '100.00-'.
*              ls_amount-CashDiscountBaseAmount = ls_item->%data-amountintransactioncurrency.
*            append ls_amount to ls_holdingtaxitem-_currencyamount.
              APPEND ls_holdingtaxitem TO ls_entry-%param-_withholdingtaxitems.
            ENDIF.

**********************************************************************

            CLEAR ls_amount.
            ls_amount-currencyrole = '00'.
            ls_amount-currency = ls_header->currencycode.
            ls_amount-journalentryitemamount = ls_item->%data-amountintransactioncurrency.
            IF ls_item->%data-taxcode IS NOT INITIAL.
              ls_amount-taxamount = 0.
              ls_amount-taxbaseamount = ls_item->%data-amountintransactioncurrency.
            ENDIF.
            APPEND ls_amount TO ls_apitem-_currencyamount.

            APPEND ls_apitem TO ls_entry-%param-_apitems.
**********************************************************************
*          WHEN 'TX'.
*            clear ls_taxitem.
*            ls_taxitem-taxcode = ls_item->%data-taxcode.
*            ls_taxitem-ConditionType = 'MWAR'.
*            ls_taxitem-IsDirectTaxPosting = 'X'.
*
*            CLEAR ls_amount.
*            ls_amount-currencyrole = '00'.
*            ls_amount-currency = ls_header->currencycode.
**            ls_amount-taxamount = ls_item->%data-amountintransactioncurrency.
*            if ls_item->%data-taxcode is not initial.
**              ls_amount-taxamount = 0.
*              ls_amount-taxbaseamount = 100.
**              ls_amount-taxbaseamount = ls_item->%data-amountintransactioncurrency.
*            endif.
*            APPEND ls_amount TO ls_taxitem-_currencyamount.
*
*            APPEND ls_taxitem TO ls_entry-%param-_taxitems.
**********************************************************************
        ENDCASE.
      ENDLOOP.
      APPEND ls_entry TO lt_entry.
    ENDLOOP.


*data: lt_entry_single    TYPE TABLE FOR ACTION IMPORT i_journalentrytp~post.
*    loop at lt_entry into data(ls_entry_single).
*      clear lt_entry_single.
*      append ls_entry_single to lt_entry_single.
*      MODIFY ENTITIES OF i_journalentrytp
*      ENTITY journalentry
*      EXECUTE post FROM lt_entry_single
*        MAPPED data(ls_post_mapped)
*        FAILED data(ls_post_failed)
*        REPORTED data(ls_post_reported).
**        MAPPED final(ls_post_mapped)
**        FAILED FINAL(ls_post_failed)
**        REPORTED FINAL(ls_post_reported).
*
*      IF ls_post_failed IS NOT INITIAL.
*        LOOP AT ls_post_reported-journalentry INTO DATA(ls_report).
**          append value #(
**                          %tky = lt_entry_single-%tky
**                          ) to failed-zr_generaljournalentry.
*          APPEND VALUE #(
*          uuid = ls_report-%cid
**                          %tky = lt_entry_single-%tky
*                          %state_area = 'error'
*                          %create = if_abap_behv=>mk-on
*                          %is_draft = if_abap_behv=>mk-on
*                          %msg = ls_report-%msg ) TO reported-zr_generaljournalentry.
*        ENDLOOP.
*      ENDIF.
*      LOOP AT ls_post_mapped-journalentry INTO DATA(ls_je_mapped).
*        ls_temp_key-cid = ls_je_mapped-%cid.
*        ls_temp_key-pid = ls_je_mapped-%pid.
*        APPEND ls_temp_key TO lt_temp_key.
*      ENDLOOP.
*     endloop.


    IF lt_entry IS NOT INITIAL.
      lt_entry_check = CORRESPONDING #( lt_entry ).
      READ ENTITIES OF i_journalentrytp
      ENTITY journalentry
      EXECUTE validate FROM lt_entry_check
      RESULT DATA(lt_check_result)
      FAILED FINAL(failed_deep)
      REPORTED FINAL(reported_deep).

      LOOP AT reported_deep-journalentry INTO DATA(ls_reported_deep) GROUP BY ( key1 = ls_reported_deep-%cid ).
*      %cid単位処理
*       data: lv_msg_header type ref to if_abap_behv_message.
*       lv_msg_header = value #( msgty = 'E'  )
        IF ls_reported_deep-%msg->if_t100_dyn_msg~msgty = 'E'.
          READ TABLE header WITH KEY uuid = ls_reported_deep-%cid INTO DATA(ls_errorinputdata).
          APPEND VALUE #( uuid = ls_reported_deep-%cid
                          %create = if_abap_behv=>mk-on
                          %is_draft = if_abap_behv=>mk-on
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = |Error ReferenceID: { ls_errorinputdata-documentreferenceid }| ) ) TO reported-zr_generaljournalentry.
          LOOP AT GROUP ls_reported_deep INTO DATA(ls_reported_deep_message).
            IF ls_reported_deep_message-%msg->if_t100_dyn_msg~msgty = 'E'.
              DATA(lv_message_check) = CONV char255( ls_reported_deep-%msg->if_message~get_text( ) ).
              DATA(lv_skip) = abap_true.
              DATA(lv_uuid_temp_check) = CONV uuid( ls_reported_deep-%cid ).

              APPEND VALUE #( uuid = ls_reported_deep_message-%cid
                                  %create = if_abap_behv=>mk-on
                                  %is_draft = if_abap_behv=>mk-on
                                  %msg = ls_reported_deep_message-%msg ) TO reported-zr_generaljournalentry.
              zgje_transaction_handler=>get_instance( )->set_message( iv_uuid = lv_uuid_temp_check
                                                                          iv_messageid = ls_reported_deep_message-%msg->if_t100_message~t100key-msgid
                                                                          iv_messageno = ls_reported_deep_message-%msg->if_t100_message~t100key-msgno
                                                                          iv_message =  lv_message_check ).
            ENDIF.
*        data(lv_result) = ls_reported_deep-%msg->if_message~get_text( ).
          ENDLOOP.
        ENDIF.
      ENDLOOP.
*       if lv_result is not initial.
*         exit.
*       endif.

      IF lv_skip = abap_false.

        MODIFY ENTITIES OF i_journalentrytp
        ENTITY journalentry
        EXECUTE post FROM lt_entry
          MAPPED FINAL(ls_post_mapped)
          FAILED FINAL(ls_post_failed)
          REPORTED FINAL(ls_post_reported).

        IF ls_post_failed IS NOT INITIAL.
          LOOP AT ls_post_failed-journalentry INTO DATA(ls_failed).
            LOOP AT ls_post_reported-journalentry INTO DATA(ls_report) WHERE %cid = ls_failed-%cid.
              APPEND VALUE #( uuid = ls_report-%cid
                              %create = if_abap_behv=>mk-on
                              %is_draft = if_abap_behv=>mk-on
                              %msg = ls_report-%msg ) TO reported-zr_generaljournalentry.
              DATA(lv_uuid_temp) = CONV uuid( ls_report-%cid ).
              DATA(lv_message) = CONV char255( ls_report-%msg->if_message~get_text( ) ).
              zgje_transaction_handler=>get_instance( )->set_message( iv_uuid = lv_uuid_temp
                                                                      iv_messageid = ls_report-%msg->if_t100_message~t100key-msgid
                                                                      iv_messageno = ls_report-%msg->if_t100_message~t100key-msgno
                                                                      iv_message = lv_message ).

*            modify ENTITIES OF zr_generaljournalentry IN LOCAL MODE
*            entity zr_generaljournalentry
*            update FIELDS ( messageID
*                            messageNo
*                            message )
*            with value #( ( uuid = ls_report-%cid
*                            messageID = ls_report-%msg->IF_T100_MESSAGE~T100KEY-MSGID
*                            messageNo = ls_report-%msg->IF_T100_MESSAGE~T100KEY-MSGNO
*                            message = 'test' ) ).

            ENDLOOP.
*        ls_temp_key-cid = ls_failed-%cid.
*        ls_temp_key-pid = ls_failed-%pid.
*        APPEND ls_temp_key TO lt_temp_key.

          ENDLOOP.
        ENDIF.
        LOOP AT ls_post_mapped-journalentry INTO DATA(ls_je_mapped).
          ls_temp_key-cid = ls_je_mapped-%cid.
          ls_temp_key-pid = ls_je_mapped-%pid.
          APPEND ls_temp_key TO lt_temp_key.
        ENDLOOP.
      ENDIF.
      zgje_transaction_handler=>get_instance( )->set_temp_key( lt_temp_key ).

    ENDIF.

  ENDMETHOD.

  METHOD fileupload.
    DATA: lt_entry    TYPE TABLE FOR ACTION IMPORT i_journalentrytp~post,
          ls_entry    LIKE LINE OF lt_entry,
          ls_glitem   LIKE LINE OF ls_entry-%param-_glitems,
          ls_amount   LIKE LINE OF ls_glitem-_currencyamount,
          lt_temp_key TYPE zgje_transaction_handler=>tt_temp_key,
          ls_temp_key LIKE LINE OF lt_temp_key.
    DATA lt_journalentry TYPE STANDARD TABLE OF ty_journalentry.
    DATA lt_journalentry_c TYPE TABLE FOR CREATE zr_generaljournalentry.
    DATA lt_journalentryitem_c TYPE TABLE FOR CREATE zr_generaljournalentry\_item.

    READ TABLE keys ASSIGNING FIELD-SYMBOL(<ls_keys>) INDEX 1.
    CHECK sy-subrc = 0.
    DATA(lv_filecontent) = <ls_keys>-%param-filecontent.

    "XCOライブラリを使用したExcelファイルの読み取り
    DATA(lo_read_access) = xco_cp_xlsx=>document->for_file_content( lv_filecontent )->read_access(  ).
    DATA(lo_worksheet) = lo_read_access->get_workbook( )->worksheet->at_position( 1 ).

    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
                                   )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
                                   )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'BS' )
                                   )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 2 )
                                   )->get_pattern( ).

    lo_worksheet->select( lo_selection_pattern )->row_stream(
                    )->operation->write_to( REF #( lt_journalentry )
                    )->if_xco_xlsx_ra_operation~execute( ).

    zgje_transaction_handler=>get_instance( )->set_inputdata( lt_journalentry ).

    "create new entity
    DATA(lv_headercount) = 0.
    DATA(lv_itemcount) = 0.

    LOOP AT lt_journalentry INTO DATA(ls_journalentry) GROUP BY ( key1 = ls_journalentry-companycode
                                                                  key2 = ls_journalentry-accountingdocumenttype
                                                                  key3 = ls_journalentry-documentheadertext
                                                                  key4 = ls_journalentry-documentdate
                                                                  key5 = ls_journalentry-postingdate
                                                                  key6 = ls_journalentry-currencycode
                                                                  key7 = ls_journalentry-documentreferenceid
                                                                  key8 = ls_journalentry-ledgergroup ).
*     ヘッダ単位処理
      lv_headercount += 1.
      DATA:
        ls_journalentry_c            LIKE LINE OF lt_journalentry_c,
        ls_journalentryitem_c        LIKE LINE OF lt_journalentryitem_c,
        ls_journalentryitem_c_target LIKE LINE OF ls_journalentryitem_c-%target,
        lt_journalentryitem_c_target LIKE ls_journalentryitem_c-%target.

      ls_journalentry_c = CORRESPONDING #( ls_journalentry ).
      ls_journalentry_c-%cid = lv_headercount.
      ls_journalentry_c-created_by = sy-uname.
      ls_journalentry_c-created_at = cl_abap_context_info=>get_system_date( ).
      APPEND ls_journalentry_c TO lt_journalentry_c.

      LOOP AT GROUP ls_journalentry INTO DATA(ls_journalentryitem).
*       明細単位処理
        lv_itemcount += 10.
        ls_journalentryitem_c_target = CORRESPONDING #( ls_journalentryitem ).
        ls_journalentryitem_c_target-amountintransactioncurrency = convert_price( i_price    = ls_journalentryitem-amountintransactioncurrency
                                                                                  i_currency = ls_journalentryitem-currencycode ).
        ls_journalentryitem_c_target-taxamount = convert_price( i_price    = ls_journalentryitem-taxamount
                                                                i_currency = ls_journalentryitem-currencycode ).
        ls_journalentryitem_c_target-%cid = |{ lv_headercount }_{ lv_itemcount }|.
        ls_journalentryitem_c_target-item_created_by = sy-uname.
        ls_journalentryitem_c_target-item_created_at = cl_abap_context_info=>get_system_date( ).

        APPEND ls_journalentryitem_c_target TO lt_journalentryitem_c_target.
      ENDLOOP.

      ls_journalentryitem_c = VALUE #( %cid_ref = lv_headercount
                                       %target = lt_journalentryitem_c_target ).
      APPEND ls_journalentryitem_c TO lt_journalentryitem_c.

      CLEAR:
        ls_journalentry_c,
        ls_journalentryitem_c,
        ls_journalentryitem_c_target,
        lt_journalentryitem_c_target,
        lv_itemcount.

    ENDLOOP.
    MODIFY ENTITIES OF zr_generaljournalentry IN LOCAL MODE
    ENTITY zr_generaljournalentry
    CREATE FIELDS (
             companycode
             accountingdocumenttype
             ledgergroup
             documentreferenceid
             documentheadertext
             documentdate
             postingdate
             exchangeratedate
             exchangerate
             currencycode
             created_by
             created_at ) WITH lt_journalentry_c
     CREATE BY \_item FIELDS (
             referencedocumentitem
             itemtype
             glaccount
             amountintransactioncurrency
             taxamount
             currencycode
             taxcode
             valuedate
             documentitemtext
             assignmentreference
             costcenter
             profitcenter
             wbselement
             orderid
             segment
             functionalarea
             personnelnumber
             housebank
             housebankaccount
             reference1idbybusinesspartner
             reference2idbybusinesspartner
             reference3idbybusinesspartner
             customer_copa
             customergroup_copa
             customerindustry_copa
             customercountry_copa
             salesdistrict_copa
             soldmaterial_copa
             soldmaterialgroup_copa
             salesorganization_copa
             distributionchannel_copa
             wbselement_copa
             functionalarea_copa
             salesorder_copa
             salesorderitem_copa
             plant_copa
             costcenter_copa
             profitcenter_copa
             customer
             duecalculationbasedate
             cashdiscount1days
             cashdiscount1percent
             cashdiscount2days
             cashdiscount2percent
             paymentterms
             paymentmethod
             paymentblockingreason
             statecentralbankpaymentreason
             specialglcode
             supplier
             bpbankaccountinternalid
             name_onetime
             name3_onetime
             cityname_onetime
             bankcountry_onetime
             bankaccount_onetime
             bankcontrolkey_onetime
             banknumber_onetime
             datamediumexchangekey_onetime
             languageisocode_onetime
             withholdingtaxtype
             withholdingtaxcode
             item_created_by
             item_created_at ) WITH lt_journalentryitem_c
    MAPPED DATA(lt_mapped_create_header)
    REPORTED DATA(lt_mapped_reported_header)
    FAILED DATA(lt_failed_create_header).

    DATA(lt_result) = zgje_transaction_handler=>get_instance( )->get_inputdata( ).

  ENDMETHOD.

  METHOD downloadfile.
    DATA lt_journalentry TYPE STANDARD TABLE OF ty_journalentry_header WITH DEFAULT KEY.
*    DATA lt_journalentryitem type standard table of ty_journalentry_item with default key.

    "XCOライブラリを使用したExcelファイルの書き込み
    "Header情報
    DATA(lo_write_access) = xco_cp_xlsx=>document->empty( )->write_access( ).
    DATA(lo_worksheet) = lo_write_access->get_workbook( )->worksheet->at_position( 1 ).

    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
                               )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
                               )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'BS' )
                               )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 1 )
                               )->get_pattern( ).

    "ヘッダの設定（すべての項目はstring型）
    lt_journalentry = VALUE #( (  companycode = '会社コード'
                                  accountingdocumenttype = '会計伝票タイプ'
                                  ledgergroup = '元帳グループ'
                                  documentreferenceid = '参照ID'
                                  documentheadertext = 'ヘッダテキスト'
                                  documentdate = '伝票日付'
                                  postingdate = '転記日付'
                                  exchangeratedate = '換算日付'
                                  exchangerate = '換算レート'
                                  referencedocumentitem = '明細番号'
                                  itemtype = '明細種別'
                                  glaccount = 'GL勘定コード'
                                  amountintransactioncurrency = '取引通貨額'
                                  taxamount = '税額'
                                  currencycode = '取引通貨'
                                  taxcode = '税コード'
                                  documentitemtext = '明細テキスト'
                                  assignmentreference = 'ソートキー'
                                  valuedate = '起算日'
                                  costcenter = '原価センタ'
                                  profitcenter = '利益センタ'
                                  wbselement = 'WBS要素'
                                  orderid = '指図'
                                  segment = 'セグメント'
                                  functionalarea = '機能領域'
                                  personnelnumber = '従業員番号'
                                  housebank = '取引銀行'
                                  housebankaccount = '取引銀行口座'
                                  reference1idbybusinesspartner = '参照キー1'
                                  reference2idbybusinesspartner = '参照キー2'
                                  reference3idbybusinesspartner = '参照キー3'
                                  customer_copa = '得意先(収益性分析)'
                                  customergroup_copa = '得意先グループ(収益性分析)'
                                  customerindustry_copa = '顧客業界(収益性分析)'
                                  customercountry_copa = '顧客国(収益性分析)'
                                  salesdistrict_copa = '販売地域(収益性分析)'
                                  soldmaterial_copa = '販売済み品目(収益性分析)'
                                  soldmaterialgroup_copa = '販売済み品目グループ(収益性分析)'
                                  salesorganization_copa = '販売組織(収益性分析)'
                                  distributionchannel_copa = '流通チャネル(収益性分析)'
                                  wbselement_copa = 'WBS要素(収益性分析)'
                                  functionalarea_copa = '機能領域(収益性分析)'
                                  salesorder_copa = '受注(収益性分析)'
                                  salesorderitem_copa = '受注明細(収益性分析)'
                                  plant_copa = 'プラント(収益性分析)'
                                  costcenter_copa = '原価センタ(収益性分析)'
                                  profitcenter_copa = '利益センタ(収益性分析)'
                                  customer = '得意先'
                                  duecalculationbasedate = '期日計算基準日'
                                  cashdiscount1days = '現金割引期間 1'
                                  cashdiscount1percent = '現金割引率 1'
                                  cashdiscount2days = '現金割引期間 2'
                                  cashdiscount2percent = '現金割引率 2'
                                  paymentterms = '支払条件'
                                  paymentmethod = '支払方法'
                                  paymentblockingreason = '支払保留'
                                  statecentralbankpaymentreason = '中央銀行コード'
                                  specialglcode = '特殊仕訳コード'
                                  supplier = '仕入先'
                                  bpbankaccountinternalid = 'パートナ銀行タイプ'
                                  name_onetime = '名称(ワンタイム)'
                                  name3_onetime = '名称3(ワンタイム)'
                                  cityname_onetime = '市区町村(ワンタイム)'
                                  bankcountry_onetime = '銀行の国/地域(ワンタイム)'
                                  bankaccount_onetime = '口座番号(ワンタイム)'
                                  bankcontrolkey_onetime = '預金種別(ワンタイム)'
                                  banknumber_onetime = '銀行コード(ワンタイム)'
                                  datamediumexchangekey_onetime  = '手数料負担Code(ワンタイム)'
                                  languageisocode_onetime = '言語キー(ワンタイム)'
                                  withholdingtaxtype = '源泉徴収税タイプ'
                                  withholdingtaxcode = '源泉徴収税コード' ) ).

    lo_worksheet->select( lo_selection_pattern
        )->row_stream(
        )->operation->write_from( REF #( lt_journalentry )
        )->execute( ).

    DATA(lv_file_content) = lo_write_access->get_file_content( ).

    result = VALUE #( FOR key IN keys (
                        %cid = key-%cid
                        %param = VALUE #(  filecontent = lv_file_content
                                           filename = 'journalentryTemplate'
                                           fileextension = 'xlsx'
                                           mimetype = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' )
                       ) ).

  ENDMETHOD.
  METHOD outputresult.
    DATA lt_journalentry TYPE STANDARD TABLE OF ty_journalentry.
    DATA ls_journalentry TYPE ty_journalentry.
    DATA lt_journalentry_header TYPE STANDARD TABLE OF ty_journalentry_header_result WITH DEFAULT KEY.

    DATA(lt_result) = zgje_transaction_handler=>get_instance( )->get_inputdata( ).

*    READ TABLE keys ASSIGNING FIELD-SYMBOL(<ls_keys>) INDEX 1.
*    CHECK sy-subrc = 0.
*    DATA(lv_filecontent) = <ls_keys>-%param-filecontent.

    "XCOライブラリを使用したExcelファイルの読み取り
*    DATA(lo_read_access) = xco_cp_xlsx=>document->for_file_content( lv_filecontent )->read_access(  ).
*    DATA(lo_worksheet_input) = lo_read_access->get_workbook( )->worksheet->at_position( 1 ).
*
*    DATA(lo_selection_pattern3) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
*                                   )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
*                                   )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'AY' )
*                                   )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 2 )
*                                   )->get_pattern( ).
*
*    lo_worksheet_input->select( lo_selection_pattern3 )->row_stream(
*                    )->operation->write_to( REF #( lt_journalentry )
*                    )->if_xco_xlsx_ra_operation~execute( ).


*    zgje_transaction_handler=>get_instance( )->clean_up( ).

    "XCOライブラリを使用したExcelファイルの書き込み
    "Header情報
    DATA(lo_write_access) = xco_cp_xlsx=>document->empty( )->write_access( ).
    DATA(lo_worksheet) = lo_write_access->get_workbook( )->worksheet->at_position( 1 ).

    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
                               )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
                               )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'BC' )
                               )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 1 )
                               )->get_pattern( ).

    "ヘッダの設定（すべての項目はstring型）
    lt_journalentry_header = VALUE #( (  companycode = '会社コード'
                                  accountingdocumenttype = '会計伝票タイプ'
                                  documentreferenceid = '参照ID'
                                  documentheadertext = 'ヘッダテキスト'
                                  documentdate = '伝票日付'
                                  postingdate = '転記日付'
                                  exchangeratedate = '換算日付'
                                  exchangerate = '換算レート'
                                  referencedocumentitem = '明細番号'
                                  itemtype = '明細種別'
                                  glaccount = 'GL勘定コード'
                                  amountintransactioncurrency = '取引通貨額'
                                  taxamount = '税額'
                                  currencycode = '取引通貨'
                                  taxcode = '税コード'
                                  documentitemtext = '明細テキスト'
                                  valuedate = '起算日'
                                  costcenter = '原価センタ'
                                  profitcenter = '利益センタ'
                                  wbselement = 'WBS要素'
                                  orderid = '指図'
                                  segment = 'セグメント'
                                  functionalarea = '機能領域'
                                  personnelnumber = '従業員番号'
                                  housebank = '取引銀行'
                                  housebankaccount = '取引銀行口座'
                                  reference1idbybusinesspartner = '参照キー1'
                                  reference2idbybusinesspartner = '参照キー2'
                                  reference3idbybusinesspartner = '参照キー3'
                                  customer_copa = '得意先(収益性分析)'
                                  customergroup_copa = '得意先グループ(収益性分析)'
                                  customerindustry_copa = '顧客業界(収益性分析)'
                                  customercountry_copa = '顧客国(収益性分析)'
                                  salesdistrict_copa = '販売地域(収益性分析)'
                                  soldmaterial_copa = '販売済み品目(収益性分析)'
                                  soldmaterialgroup_copa = '販売済み品目グループ(収益性分析)'
                                  salesorganization_copa = '販売組織(収益性分析)'
                                  distributionchannel_copa = '流通チャネル(収益性分析)'
                                  wbselement_copa = 'WBS要素(収益性分析)'
                                  customer = '得意先'
                                  duecalculationbasedate = '期日計算基準日'
                                  cashdiscount1days = '現金割引期間 1'
                                  cashdiscount1percent = '現金割引率 1'
                                  cashdiscount2days = '現金割引期間 2'
                                  cashdiscount2percent = '現金割引率 2'
                                  paymentterms = '支払条件'
                                  paymentmethod = '支払方法'
                                  paymentblockingreason = '支払保留'
                                  statecentralbankpaymentreason = '中央銀行コード'
                                  specialglcode = '特殊仕訳コード'
                                  supplier = '仕入先'
                                  uuid = 'UUID'
                                  messageid = 'メッセージID'
                                  messageno = 'メッセージNo'
                                  message = 'メッセージ' ) ).

    lo_worksheet->select( lo_selection_pattern
        )->row_stream(
        )->operation->write_from( REF #( lt_journalentry_header )
        )->execute( ).

    DATA(lo_selection_pattern2) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
                               )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
                               )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'BC' )
                               )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 2 )
                               )->get_pattern( ).


    "ヘッダの設定（すべての項目はstring型）
    LOOP AT lt_journalentry INTO ls_journalentry.
*      DATA(test) = reported-zr_generaljournalentry.
*      read entity zr_generaljournalentry in local mode
*      from value #( ( %key-uuid = 1 ) )
*      result final(result)
*      failed final(failed)
*      reported final(reported).

*      READ ENTITIES OF zr_generaljournalentry IN LOCAL MODE
*          ENTITY zr_generaljournalentry ALL FIELDS WITH VALUE #( ( companycode = 1 ) )
**        companycode = ls_journalentry-companycode
**                                                               accountingdocument = ls_journalentry-
**                                                               documentreferenceid = ls_journalentry-
**                                                               documentheadertext = ls_journalentry-
**                                                               postingfiscalperiod = ls_journalentry-
**                                                               accountingdocumenttype = ls_journalentry-
**                                                               documentdate = ls_journalentry-
**                                                               postingdate = ls_journalentry-
**                                                               exchangeratedate = ls_journalentry-
**                                                               exchangerate = ls_journalentry-
**                                                               currencycode = ls_journalentry- )
*                                                                 RESULT FINAL(header)
*          ENTITY zr_generaljournalentry BY \_item ALL FIELDS WITH value #( ( uuid = 1 ) ) RESULT FINAL(item).
*     select * from zr_generaljournalentry where ( companycode = @ls_journalentry-companycode and
*                                                  documentreferenceid = @ls_journalentry-documentreferenceid and
*                                                  documentheadertext = @ls_journalentry-documentheadertext and
*                                                  accountingdocumenttype = @ls_journalentry-accountingdocumenttype and
*                                                  documentdate = @ls_journalentry-documentdate and
*                                                  postingdate = @ls_journalentry-postingdate and
*                                                  exchangeratedate = @ls_journalentry-exchangeratedate and
*                                                  exchangerate = @ls_journalentry-exchangerate and
*                                                  currencycode = @ls_journalentry-currencycode ) into table @data(header).
*      LOOP AT item REFERENCE INTO DATA(ls_item).
**        READ TABLE header WITH KEY uuid = ls_item->uuid INTO DATA(ls_header).
*        CLEAR ls_journalentry.
*        ls_journalentry-companycode = ls_header-companycode.
*        ls_journalentry-accountingdocumenttype = ls_header-accountingdocumenttype.
*        ls_journalentry-documentreferenceid = ls_header-documentreferenceid.
*        ls_journalentry-documentheadertext = ls_header-documentheadertext.
*        ls_journalentry-documentdate = ls_header-documentdate.
*        ls_journalentry-postingdate = ls_header-postingdate.
*        ls_journalentry-exchangeratedate = ls_header-exchangeratedate.
*        ls_journalentry-exchangerate = ls_header-exchangerate.
**            明細項目
*        ls_journalentry-referencedocumentitem = ls_item->%data-referencedocumentitem.
*        ls_journalentry-itemtype = ls_item->%data-itemtype.
*        ls_journalentry-glaccount = ls_item->%data-glaccount.
*        ls_journalentry-amountintransactioncurrency = ls_item->%data-amountintransactioncurrency.
*        ls_journalentry-taxamount = ls_item->%data-taxamount.
*        ls_journalentry-currencycode = ls_item->%data-currencycode.
*        ls_journalentry-taxcode = ls_item->%data-taxcode.
*        ls_journalentry-valuedate = ls_item->%data-valuedate.
*        ls_journalentry-documentitemtext = ls_item->%data-documentitemtext.
*        ls_journalentry-costcenter = ls_item->%data-costcenter.
*        ls_journalentry-profitcenter = ls_item->%data-profitcenter.
*        ls_journalentry-wbselement = ls_item->%data-wbselement.
*        ls_journalentry-orderid = ls_item->%data-orderid.
*        ls_journalentry-segment = ls_item->%data-segment.
*        ls_journalentry-functionalarea = ls_item->%data-functionalarea.
*        ls_journalentry-housebank = ls_item->%data-housebank.
*        ls_journalentry-housebankaccount = ls_item->%data-housebankaccount.
*        ls_journalentry-reference1idbybusinesspartner = ls_item->%data-reference1idbybusinesspartner.
*        ls_journalentry-reference2idbybusinesspartner = ls_item->%data-reference2idbybusinesspartner.
*        ls_journalentry-reference3idbybusinesspartner = ls_item->%data-reference3idbybusinesspartner.
*        ls_journalentry-customer_copa = ls_item->%data-customer_copa.
*        ls_journalentry-customergroup_copa = ls_item->%data-customergroup_copa.
*        ls_journalentry-customerindustry_copa = ls_item->%data-customerindustry_copa.
*        ls_journalentry-customercountry_copa = ls_item->%data-customercountry_copa.
*        ls_journalentry-salesdistrict_copa = ls_item->%data-salesdistrict_copa.
*        ls_journalentry-soldmaterial_copa = ls_item->%data-soldmaterial_copa.
*        ls_journalentry-soldmaterialgroup_copa = ls_item->%data-soldmaterialgroup_copa.
*        ls_journalentry-salesorganization_copa = ls_item->%data-salesorganization_copa.
*        ls_journalentry-distributionchannel_copa = ls_item->%data-distributionchannel_copa.
*        ls_journalentry-personnelnumber_copa = ls_item->%data-personnelnumber_copa.
*        ls_journalentry-wbselement_copa = ls_item->%data-wbselement_copa.
*        ls_journalentry-customer = ls_item->%data-customer.
*        ls_journalentry-duecalculationbasedate = ls_item->%data-duecalculationbasedate.
*        ls_journalentry-cashdiscount1days = ls_item->%data-cashdiscount1days.
*        ls_journalentry-cashdiscount1percent = ls_item->%data-cashdiscount1percent.
*        ls_journalentry-cashdiscount2days = ls_item->%data-cashdiscount2days.
*        ls_journalentry-cashdiscount2percent = ls_item->%data-cashdiscount2percent.
*        ls_journalentry-paymentterms = ls_item->%data-paymentterms.
*        ls_journalentry-paymentmethod = ls_item->%data-paymentmethod.
*        ls_journalentry-paymentblockingreason = ls_item->%data-paymentblockingreason.
*        ls_journalentry-statecentralbankpaymentreason = ls_item->%data-statecentralbankpaymentreason.
*        ls_journalentry-specialglcode = ls_item->%data-specialglcode.
*        ls_journalentry-supplier = ls_item->%data-supplier.
*        APPEND ls_journalentry TO lt_journalentry.
*      ENDLOOP.
    ENDLOOP.

    lo_worksheet->select( lo_selection_pattern2
        )->row_stream(
        )->operation->write_from( REF #( lt_result )
        )->execute( ).

    DATA(lv_file_content) = lo_write_access->get_file_content( ).

    result = VALUE #( FOR key IN keys (
                        %cid = key-%cid
                        %param = VALUE #(  filecontent = lv_file_content
                                           filename = 'journalentry_Result'
                                           fileextension = 'xlsx'
                                           mimetype = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' )
                       ) ).

  ENDMETHOD.

  METHOD convert_price.
* https://userapps.support.sap.com/sap/support/knowledge/en/2973787
    SELECT SINGLE * FROM i_currency
    WHERE currency = @i_currency
    INTO @DATA(ls_curx).

    CHECK sy-subrc IS INITIAL.
    r_price = i_price * ( 10 ** ls_curx-decimals / 100 ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zr_generaljournalentry DEFINITION INHERITING FROM cl_abap_behavior_saver_failed.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zr_generaljournalentry IMPLEMENTATION.

  METHOD save_modified.
    "unmanaged save for table ZGJE_HEADER
    DATA: lt_create TYPE TABLE OF zgje_header,
          lt_delete TYPE TABLE OF zgje_header.
*    DATA lt_journalentry TYPE STANDARD TABLE OF ty_journalentry.
*    DATA ls_journalentry TYPE ty_journalentry.
*    DATA lt_journalentry_header TYPE STANDARD TABLE OF ty_journalentry_header WITH DEFAULT KEY.

    DATA(test) = reported-zr_generaljournalentry.

    lt_create = CORRESPONDING #( create-zr_generaljournalentry MAPPING FROM ENTITY ).
    lt_delete = CORRESPONDING #( delete-zr_generaljournalentry MAPPING FROM ENTITY ).
    zgje_transaction_handler=>get_instance( )->additional_save( it_create = lt_create
                                                                it_delete = lt_delete ).
    DATA(lt_result) = zgje_transaction_handler=>get_instance( )->get_inputdata( ).
    LOOP AT lt_result INTO DATA(ls_result).
      IF ls_result-message IS NOT INITIAL.
        APPEND VALUE #( uuid = ls_result-uuid
                            %create = if_abap_behv=>mk-on
                            %is_draft = if_abap_behv=>mk-on
*                            %fail = ls_report-%msg
                             ) TO failed-zr_generaljournalentry.
      ENDIF.
    ENDLOOP.

*    DATA(lo_write_access) = xco_cp_xlsx=>document->empty( )->write_access( ).
*    DATA(lo_worksheet) = lo_write_access->get_workbook( )->worksheet->at_position( 1 ).
*
*    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
*                               )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
*                               )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'AY' )
*                               )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 1 )
*                               )->get_pattern( ).
*    "ヘッダの設定（すべての項目はstring型）
*    lt_journalentry_header = VALUE #( (  companycode = '会社コード'
*                                  accountingdocumenttype = '会計伝票タイプ'
*                                  documentreferenceid = '参照ID'
*                                  documentheadertext = 'ヘッダテキスト'
*                                  documentdate = '伝票日付'
*                                  postingdate = '転記日付'
*                                  exchangeratedate = '換算日付'
*                                  exchangerate = '換算レート'
*                                  referencedocumentitem = '明細番号'
*                                  itemtype = '明細種別'
*                                  glaccount = 'GL勘定コード'
*                                  amountintransactioncurrency = '取引通貨額'
*                                  taxamount = '税額'
*                                  currencycode = '取引通貨'
*                                  taxcode = '税コード'
*                                  documentitemtext = '明細テキスト'
*                                  valuedate = '起算日'
*                                  costcenter = '原価センタ'
*                                  profitcenter = '利益センタ'
*                                  wbselement = 'WBS要素'
*                                  orderid = '指図'
*                                  segment = 'セグメント'
*                                  functionalarea = '機能領域'
*                                  housebank = '取引銀行'
*                                  housebankaccount = '取引銀行口座'
*                                  reference1idbybusinesspartner = '参照キー1'
*                                  reference2idbybusinesspartner = '参照キー2'
*                                  reference3idbybusinesspartner = '参照キー3'
*                                  customer_copa = '得意先(収益性分析)'
*                                  customergroup_copa = '得意先グループ(収益性分析)'
*                                  customerindustry_copa = '顧客業界(収益性分析)'
*                                  customercountry_copa = '顧客国(収益性分析)'
*                                  salesdistrict_copa = '販売地域(収益性分析)'
*                                  soldmaterial_copa = '販売済み品目(収益性分析)'
*                                  soldmaterialgroup_copa = '販売済み品目グループ(収益性分析)'
*                                  salesorganization_copa = '販売組織(収益性分析)'
*                                  distributionchannel_copa = '流通チャネル(収益性分析)'
*                                  personnelnumber_copa = '従業員番号(収益性分析)'
*                                  wbselement_copa = 'WBS要素(収益性分析)'
*                                  customer = '得意先'
*                                  duecalculationbasedate = '期日計算基準日'
*                                  cashdiscount1days = '現金割引期間 1'
*                                  cashdiscount1percent = '現金割引率 1'
*                                  cashdiscount2days = '現金割引期間 2'
*                                  cashdiscount2percent = '現金割引率 2'
*                                  paymentterms = '支払条件'
*                                  paymentmethod = '支払方法'
*                                  paymentblockingreason = '支払保留'
*                                  statecentralbankpaymentreason = '中央銀行コード'
*                                  specialglcode = '特殊仕訳コード'
*                                  supplier = '仕入先' ) ).
*
*    lo_worksheet->select( lo_selection_pattern
*        )->row_stream(
*        )->operation->write_from( REF #( lt_journalentry_header )
*        )->execute( ).
*
*    DATA(lo_selection_pattern2) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
*                               )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
*                               )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'AY' )
*                               )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 2 )
*                               )->get_pattern( ).
*    lo_worksheet->select( lo_selection_pattern2
*        )->row_stream(
*        )->operation->write_from( REF #( lt_result )
*        )->execute( ).
*
*    DATA(lv_file_content) = lo_write_access->get_file_content( ).
*
*    result = VALUE #( FOR key IN keys (
*                        %cid = key-%cid
*                        %param = VALUE #(  filecontent = lv_file_content
*                                           filename = 'journalentry_Result'
*                                           fileextension = 'xlsx'
*                                           mimetype = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' )
*                       ) ).

  ENDMETHOD.

  METHOD cleanup_finalize.
    zgje_transaction_handler=>get_instance( )->clean_up( ).
  ENDMETHOD.

ENDCLASS.
