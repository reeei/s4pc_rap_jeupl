@EndUserText.label: 'ファイルアップロード'
define abstract entity ZI_FILE_ABS
{
    mimeType : abap.string(0);
    fileName: abap.string(0);
    fileContent: abap.rawstring(0);
    fileExtension: abap.string(0);
}
