unit UCAD_TP_REUNIAO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_TP_REUNIAO = class(Tfrm)
    txtCOD_TP_REUNIAO: TEditLabel;
    edtNOM_TP_REUNIAO: TEditLabel;
    GroupBox1: TGroupBox;
    RadioButtonTag1: TRadioButtonTag;
    RadioButtonTag2: TRadioButtonTag;
    RadioButtonTag3: TRadioButtonTag;
    RadioButtonTag4: TRadioButtonTag;
    RadioButtonTag5: TRadioButtonTag;
    RadioButtonTag6: TRadioButtonTag;
    RadioButtonTag7: TRadioButtonTag;
    procedure FormCreate(Sender: TObject);
    procedure txtCOD_TP_REUNIAOChange(Sender: TObject);
    procedure txtCOD_TP_REUNIAOEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCAD_TP_REUNIAO: TfrmCAD_TP_REUNIAO;

implementation

{$R *.dfm}

procedure TfrmCAD_TP_REUNIAO.FormCreate(Sender: TObject);
begin
  Tabela := 'CAD_TP_REUNIAO';
  inherited;


end;

procedure TfrmCAD_TP_REUNIAO.txtCOD_TP_REUNIAOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_TP_REUNIAO);
end;

procedure TfrmCAD_TP_REUNIAO.txtCOD_TP_REUNIAOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_TP_REUNIAO);
end;

end.
