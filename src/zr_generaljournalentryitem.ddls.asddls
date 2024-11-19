@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'JE明細ビュー'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
//define view entity ZR_GeneralJournalEntryItem
// as select from I_FixedAsset
//{
//    key CompanyCode,
//    key OriginalMasterFixedAsset,
//    'X' as Transferred
//}



define view entity ZR_GeneralJournalEntryItem
  as select from zgje_item
  association to parent ZR_GeneralJournalEntry as _Header on $projection.Uuid = _Header.Uuid
{
  key uuid                 as Uuid,
  key referencedocumentitem,
      itemtype,
      glaccount,
      @Semantics.amount.currencyCode: 'currencyCode'
      amountintransactioncurrency,
      @Semantics.amount.currencyCode: 'currencyCode'
      taxamount,
      _Header.currencycode as currencyCode,
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
      item_created_by      as Item_Created_By,
      @Semantics.systemDateTime.createdAt: true
      item_created_at      as Item_Created_At,
      @Semantics.user.lastChangedBy: true
      item_last_changed_by as Item_Last_Changed_By,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      item_last_changed_at as Item_Last_Changed_At,
      _Header
}
