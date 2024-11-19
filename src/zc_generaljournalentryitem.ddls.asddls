@EndUserText.label: 'JE明細Projectionビュー'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
//define view entity ZC_GeneralJournalEntryItem as select from I_FixedAsset
//{
//    key CompanyCode,
//    key OriginalMasterFixedAsset
//}

define view entity ZC_GeneralJournalEntryItem
  as projection on ZR_GeneralJournalEntryItem
{
  key Uuid,
  key referencedocumentitem,
      itemtype,
      glaccount,
      @Semantics.amount.currencyCode: 'currencyCode'
      amountintransactioncurrency,
      @Semantics.amount.currencyCode: 'currencyCode'
      taxamount,
      currencyCode,
      documentitemtext,
      assignmentreference,
      taxcode,
      valuedate,
      costcenter,
      profitcenter,
      wbselement,
      orderid,
      segment,
      functionalarea,
      personnelnumber,
      housebank,
      housebankaccount,
      reference1idbybusinesspartner,
      reference2idbybusinesspartner,
      reference3idbybusinesspartner,
      customer_copa,
      customergroup_copa,
      customerindustry_copa,
      customercountry_copa,
      salesdistrict_copa,
      soldmaterial_copa,
      soldmaterialgroup_copa,
      salesorganization_copa,
      distributionchannel_copa,
//      personnelnumber_copa,
      wbselement_copa,
      functionalarea_copa,
      salesorder_copa,
      salesorderitem_copa,
      plant_copa,
      costcenter_copa,
      profitcenter_copa,
      
      customer,
      duecalculationbasedate,
      cashdiscount1days,
      cashdiscount1percent,
      cashdiscount2days,
      cashdiscount2percent,
      paymentterms,
      paymentmethod,
      paymentblockingreason,
      statecentralbankpaymentreason,
      specialglcode,
      
      supplier,
      bpbankaccountinternalid,
      
      name_onetime,
      name3_onetime,
      cityname_onetime,
      bankcountry_onetime,
      bankaccount_onetime,
      bankcontrolkey_onetime,
      banknumber_onetime,
      datamediumexchangekey_onetime,
      languageisocode_onetime,
      
      withholdingtaxtype,
      withholdingtaxcode,
      
      @Semantics.user.createdBy: true
      Item_Created_By,
      @Semantics.systemDateTime.createdAt: true
      Item_Created_At,
      @Semantics.user.lastChangedBy: true
      Item_Last_Changed_By,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      Item_Last_Changed_At,
      _Header : redirected to parent ZC_GeneralJournalEntry
}
