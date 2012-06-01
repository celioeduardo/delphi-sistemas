unit UCAD_TP_PARTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_TP_PARTE = class(Tfrm)
    txtCOD_TP_PARTE: TEditLabel;
    EditLabel2: TEditLabel;
    EditLabel3: TEditLabel;
    grpDesignacao: TGroupBox;
    optAmbos: TRadioButtonTag;
    optIrmaos: TRadioButtonTag;
    optIrmas: TRadioButtonTag;
    grpCaracteristica: TGroupBox;
    optInstrucao: TRadioButtonTag;
    optPrivilegio: TRadioButtonTag;
    edtNomParteResumido: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure txtCOD_TP_PARTEChange(Sender: TObject);
    procedure txtCOD_TP_PARTEEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCAD_TP_PARTE: TfrmCAD_TP_PARTE;

implementation

{$R *.dfm}

procedure TfrmCAD_TP_PARTE.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_TP_PARTE';
end;

procedure TfrmCAD_TP_PARTE.txtCOD_TP_PARTEChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_TP_PARTE);
end;

procedure TfrmCAD_TP_PARTE.txtCOD_TP_PARTEEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_TP_PARTE);
end;

end.
