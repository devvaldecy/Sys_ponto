unit u_cadsetor;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBGrids, Buttons, u_datamod, u_cadpadrao;

type

  { TFrmCadSetor }

  TFrmCadSetor = class(TFrmcadpadrao)
    BitPesquisar: TBitBtn;
    cbescolha: TComboBox;
    DSConsultar: TDataSource;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    EdtNome: TEdit;
    EdtEmail: TEdit;
    EdtContato: TEdit;
    edtPesquisar: TEdit;
    LblRegistros: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LblRegistros1: TLabel;
    PageControl1: TPageControl;
    pgLancadados: TTabSheet;
    pgPesquisar: TTabSheet;
    procedure BitPesquisarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Habilitar;
    procedure Limpar;
  public

  end;

var
  FrmCadSetor: TFrmCadSetor;

implementation

{$R *.lfm}

{ TFrmCadSetor }

procedure TFrmCadSetor.BtnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := pgLancadados;
  EdtNome.SetFocus;
end;

procedure TFrmCadSetor.BitPesquisarClick(Sender: TObject);
begin
    if edtPesquisar.Text = '' then
  begin
  ShowMessage('Campos não podem ser vazio...');
  edtPesquisar.SetFocus;
  end
  Else
  Begin
  with FrmDM.zQconsultasetor do
  begin
  Close;
  SQL.Clear;
  case CbEscolha.ItemIndex of
  0: Begin
  SQL.Add('Select * from setor where id = ' + edtPesquisar.Text);
  edtPesquisar.SetFocus;
  end;
  2: begin
  SQL.Add('Select * from setor where nome LIKE ' + QuotedStr( '%' + edtPesquisar.Text + '%' ));
  edtPesquisar.SetFocus;
  end;

  3: begin
  SQL.Add('Select * from setor order by id');
  edtPesquisar.SetFocus;
  end;
  end;
  Open;
  LblRegistros.Caption := IntToStr(RecordCount);
  if RecordCount = 0 then
  ShowMessage('Registro não encontrado .... ');
  Habilitar;
  end;
  end;
end;

procedure TFrmCadSetor.BtnPesquisarClick(Sender: TObject);
begin
  PageControl1.ActivePage := pgPesquisar;
end;

procedure TFrmCadSetor.BtnSalvarClick(Sender: TObject);
begin

end;

procedure TFrmCadSetor.FormCreate(Sender: TObject);
begin
    //cbescolha.SetFocus;
end;

procedure TFrmCadSetor.Habilitar;
begin
    // Habilitar Botões
    BtnAlterar.Enabled   :=True;
    BtnDeletar.Enabled   :=True;
    BtnCancelar.Enabled  :=True;
    BtnPesquisar.Enabled :=True;
    BtnSalvar.Enabled    :=True;
end;

procedure TFrmCadSetor.Limpar;
begin
    // Rotina de limpar campos
    edtCodigo.Clear;
    EdtNome.Clear;
    EdtEmail.Clear;
    EdtContato.Clear;
end;

end.

