unit u_cadpadrao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, Menus;

type

  { TFrmcadpadrao }

  TFrmcadpadrao = class(TForm)
    BitBtn6: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnDeletar: TBitBtn;
    BtnNovo: TBitBtn;
    BtnPesquisar: TBitBtn;
    BtnSalvar: TBitBtn;
    PnlLest: TPanel;
    PnlTop: TPanel;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Frmcadpadrao: TFrmcadpadrao;

implementation

{$R *.lfm}

{ TFrmcadpadrao }

procedure TFrmcadpadrao.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then begin
  SelectNext(ActiveControl as TWinControl,True,True);
  key:=#0;
  end;
end;

procedure TFrmcadpadrao.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

end.

