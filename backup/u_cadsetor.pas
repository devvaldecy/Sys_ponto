unit u_cadsetor;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBGrids, Buttons, MaskEdit, u_datamod, u_cadpadrao;

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
    edtPesquisar: TEdit;
    LblRegistros: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LblRegistros1: TLabel;
    EdtTelefone: TMaskEdit;
    PageControl1: TPageControl;
    pgLancadados: TTabSheet;
    pgPesquisar: TTabSheet;
    procedure BitPesquisarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  pgLancadados.Caption    := 'Inserir novo registro';
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

procedure TFrmCadSetor.BtnAlterarClick(Sender: TObject);
begin
  with FrmDM.zCadset do
  Begin
       if QuestionDlg('Confirmação','Excluir o Registro',mtConfirmation,
         [mrYes,'Sim', mrNo, 'Não'],0) = mrYes then
         Close;
         SQL.Clear;
         SQL.Add('update setor set nome = :pnome, email = :pemail, telefone = :ptelefone where id =:pid');
         ParamByName('pnome').AsString     := EdtNome.Text;
         ParamByName('pemail').AsString    := EdtEmail.Text;
         ParamByName('ptelefone').AsString := EdtTelefone.Text;
         ParamByName('pid').AsInteger      := StrToInt(edtCodigo.Text);
         ExecSQL;
         Limpar;
             try
                ExecSQL;
                 ShowMessage('Atualizado com sucesso');
              except on E:Exception do
                ShowMessage('Erro ao atualizar o registro');
        end;
   end;
end;

procedure TFrmCadSetor.BtnDeletarClick(Sender: TObject);
begin
 with FrmDM.zCadset do
   begin
   Active:=false;
   Close;
   sql.Clear;
   sql.Add('Delete from setor where id = :pid');
   ParamByName('pid').AsInteger := StrToInt(edtCodigo.Text);
  if QuestionDlg('Confirmação','Excluir o Registro',mtConfirmation,
       [mrYes,'Sim', mrNo, 'Não'],0) = mrYes then
      try
        ExecSQL;
         ShowMessage('Excluido com seucesso');
      except on E:Exception do
        ShowMessage('Erro ao Excluir o registro');
      end;
 end;
end;

procedure TFrmCadSetor.BtnPesquisarClick(Sender: TObject);
begin
  PageControl1.ActivePage := pgPesquisar;
  pgLancadados.Caption    := 'Pesquisando...';
end;

procedure TFrmCadSetor.BtnSalvarClick(Sender: TObject);
begin
 if EdtNome.Text = '' then
    begin
    ShowMessage('Campo vazio preenchar pra continuar');
    EdtNome.SetFocus;
    end
      Else
    Begin
    with FrmDM.zCadset do
    begin
      Close;
      Sql.Clear;
      SQL.Add('INSERT INTO setor');
      SQL.Add('(nome, email, telefone)');
      SQL.Add('values (:pnome, :pemail, :ptelefone)');
      ParamByName('pnome').AsString    := EdtNome.Text;
      ParamByName('pemail').AsString   := EdtEmail.Text;
      ParamByName('ptelefone').AsString := EdtTelefone.Text;
      ExecSQL;
      ShowMessage('Registro inserido com sucesso....');
      Limpar;
      EdtNome.SetFocus;
   end;
end;
end;

procedure TFrmCadSetor.DBGrid1DblClick(Sender: TObject);
begin
     // Colocar dados nos edtis
     if PageControl1.ActivePage =  pgPesquisar then
        begin
        PageControl1.ActivePage := pgLancadados
        end;
     edtCodigo.Text   := IntToStr(DBGrid1.Columns[0].Field.Value);
     EdtNome.Text     := DBGrid1.Columns[1].Field.Value;
     EdtEmail.Text    := DBGrid1.Columns[2].Field.Value;
     //EdtTelefone.Text := DBGrid1.Columns[3].Field.Value;
     EdtTelefone.Text := DBGrid1.Columns[3].Field.Value;
     EdtNome.SetFocus;
end;

procedure TFrmCadSetor.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
 with FrmDM.zCadset do
   begin
   Active:=false;
   Close;
   sql.Clear;
   end;
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
    EdtTelefone.Clear;
end;

end.

