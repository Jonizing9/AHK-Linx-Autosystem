﻿ ; Created by Asger Juul Brunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;------------------|
;;; DEFINE VARS ;;;|
;------------------|
DetectHiddenWindows On

; this is just a dummy condition, so that everything else starts with "else if Command ="
if 1 = 2
{ }


;-------------------------------------------------------------------------------
;;; BUSCAS COM PARÂMETROS  ;;;
;-------------------------------------------------------------------------------
else if Command = g%A_Space% ; Pesquisa Google
{
    gui_search_title := "Google, quero saber:"
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Command = ahk%A_Space% ; Pesquisa Google para coisas relacionadas ao AutoHotkey
{
    gui_search_title := "Google, sobre o AutoHotKey, quero saber:"
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Command = y%A_Space% ; Buscar no Youtube
{
    gui_search_title := "Buscar no Youtube:"
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
else if Command = in%A_Space% ; Buscar CNPJ no Intranet
{
    gui_search_title := "CNPJ do Cliente Intranet:"
    gui_search("http://intranet.lzt.com.br/cliente/pesquisar/REPLACEME")
}

;-------------------------------------------------------------------------------
; CADASTRO DE CLIENTE PARA SALESFORCE
;-------------------------------------------------------------------------------

else if Command = fast%A_Space% ; Buscar CNPJ no Intranet
{
    gui_register_case()
}

;-------------------------------------------------------------------------------
;;; ABRIR AUTOSYSTEM ;;;
;-------------------------------------------------------------------------------

else if Command = main ; Abre o Gerencial
{
    gui_destroy()
    run "%aspath%\main.exe"
}
else if Command = paf ; Abre o PAF
{
    gui_destroy()
    run "%aspath%\paf.exe"
}
else if Command = comanda ; Abre a Comanda (paf.exe -terminal_comanda)
{
    gui_destroy()
    run "%aspath%\paf.exe -terminal_comanda"
}
else if Command = manutencao ; Abre o Manutenção
{
    gui_destroy()
    run "%aspath%\manutencao.exe"
}
else if Command = gerenciador ; Abre o Gerenciador
{
    gui_destroy()
    run "%aspath%\gerenciador.exe"
}
else if Command = configlocal ; Abre o config_local
{
    gui_destroy()
    run "%aspath%\config_local.exe"
}
else if Command = as%A_Space% ; Abre a pasta do AutoSystem
{
    gui_destroy()
    run "\autosystem"
}
else if Command = aslog ; Abre o autosystem.log no Baretail
{
    gui_destroy()
    run "%aspath%\log\baretail.exe" "%aspath%\log\autosystem.log"
}
else if Command = baretail ; Abre o .log especificado no Baretail
{
    
    gui_search_title := "Qual log você deseja abrir?"
    gui_search("%aspath%\log\baretail.exe " "REPLACEME.log")
    debugmsg(search_final_url)
    gui_destroy()
}
else if Command = acbd  ; Abre o AutoConfigBD
{
	gui_destroy()
	run "%A_ScriptDir%\AutoConfigBD\AutoConfigDB.exe"
}
else if Command = tmvr ; Abre o TeamViewer
{
	gui_destroy()
	run "C:\Program Files\TeamViewer\TeamViewer.exe"
}

;-------------------------------------------------------------------------------
;;; #DocumentaçãoBraba VIA SALESFORCE ;;;
;-------------------------------------------------------------------------------
else if Command = taxo ; Abre a IT de Taxonomias do AutoSystem
{
    gui_destroy()
    run "https://share.linx.com.br/pages/releaseview.action?spaceKey=POSTOSSUPORTE&title=Taxonomias+Autosystem+encerramento"
}
else if Command = relatorios ; Abre a IT de Relatórios  do AutoSystem
{
    gui_destroy()
    run "https://share.linx.com.br/pages/viewpage.action?pageId=20176629"
}
else if Command = equipamentos ; Abre a IT de Equipamentos Homologados do AutoSystem
{
    gui_destroy()
    run "https://share.linx.com.br/display/POSTOS/Equipamentos+Homologados+AutoSystem"
}
else if Command = sitef ; Abre a IT de Instalação do Sitef
{
    gui_destroy()
    run "https://share.linx.com.br/pages/viewpage.action?pageId=168644943"
}
else if Command = adquirentes ; Abre a IT de Lista de Adquirentes Homologadas
{
    gui_destroy()
    run "https://share.linx.com.br/display/public/MPGTOSUP/Lista+de+adquirentes+homologadas+no+Equals+Lite"
}
else if Command = db%A_Space% ; #DocumentaçãoBraba - Abre a HashTag da DocumentaçãoBraba.
{
    gui_destroy()
    run "https://suportelinx.lightning.force.com/lightning/r/Topic/0TOTT0000000oBJ4AY/view"
}
else if Command = dbdevolucao ; #DocumentaçãoBraba - Devolução de Vendas
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000d5ECE0A2/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbgrid ; #DocumentaçãoBraba - grid=grid
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000eWbK10AK/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbassinasat ; #DocumentaçãoBraba - Assinatura do SAT
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000cM0570AC/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbspedxml ; #DocumentaçãoBraba - Exportação de XML e Geração de Sped (AutoSystem)
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000QRSIz0AP/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbcargatabela ; #DocumentaçãoBraba - Carga de Tabelas
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000ZxRb90AF/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbecfkey ; #DocumentaçãoBraba - ECF Key
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000QRSIz0AP/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbxmltec ; #DocumentaçãoBraba - Envio de XML pelo TecFiscal
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000WmHfS0AV/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbdtefsenha ; #DocumentaçãoBraba - Senha de Instalação DTEF
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000Xk9Ma0AJ/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbencerrante ; #DocumentaçãoBraba - Erro SPED - Encerrante Final menor que o Inicial no Depósito
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000XaMTk0AN/view?ws=%2Flightning%2Fr%2FCase%2F500TT00000I1E51YAF%2Fview"
    run %DBlink%
}
else if Command = dbterminal ; #DocumentaçãoBraba - Não existe terminal PC configurado para esta estação (IP: ###.###.##.##)
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000WRsRi0AL/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbconcil ; #DocumentaçãoBraba - Conciliação QRLinx
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000VCFTF0A5/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbcodgtin ; #DocumentaçãoBraba - Código de barras (GTIN) igual ao Código!
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000SyjQM0AZ/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbimpressaocaixa ; #DocumentaçãoBraba - Desabilitar a Impressão de Fechamento de Caixa
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000S1ZIe0AN/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbestornocontas ; #DocumentaçãoBraba - Estorno de Contas a Receber
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT00000d5ECE0A2/view?ws=%2Flightning%2Fr%2FTopic%2F0TOTT0000000oBJ4AY%2Fview"
    run %DBlink%
}
else if Command = dbdetalhafaturas ; #DocumentaçãoBraba - Configuração para gerar Relatório de Detalhamento de Faturas;
{
    gui_destroy()
    DBLink := "https://suportelinx.lightning.force.com/lightning/r/0D5TT000011LUYQ0A4/view?ws=%2Flightning%2Fr%2FCase%2F500TT00000X7E02YAF%2Fview"
    run %DBlink%
}
else if Command = dbnotasgmail ; #DocumentaçãoBraba - Envio de emails de faturamento utilizando Gmail.
{
    gui_destroy()
    DBLink := "https://www.youtube.com/watch?v=6o_f_-YMhaU"
    run %DBlink%
}
else if Command = planissue ; Planilhas de Issues - Gerencial
{
    gui_destroy()
    run % "https://grupolinx-my.sharepoint.com/:x:/g/personal/roger_candeo_linx_com_br/EQEZ2hyJeiNElMaJqNvPM6QBFFjDA7enFK9irQ7XPyW55Q"
}

;-------------------------------------------------------------------------------
;;; ABRIR WEBSITES & PROGRAMAS ;;;
;-------------------------------------------------------------------------------
else if Command = plantao ; Tabela de Plantões N1 e N2
{
    gui_destroy()
    run "https://docs.google.com/spreadsheets/d/1jLOgrq3hnRTp3Og75cr2XG6Do8meGPj3/edit?usp=sharing&ouid=115178910098429536851&rtpof=true&sd=true"
}
else if Command = folgas ; Tabela de Folgas N1 e N2
{
    gui_destroy()
    run "https://docs.google.com/spreadsheets/d/1rlUSeCJRYl7zTnf2jesXZdbsZ7iOBdsK/edit?usp=sharing&ouid=115178910098429536851&rtpof=true&sd=true"
}
else if Command = home ; Tabela da Escala Híbrida N2
{
    gui_destroy()
    run "https://docs.google.com/spreadsheets/d/1jVlu4lgejOCYdNyPgoGYI_OseHaN2LOaEDIJj-lQH0U/edit#gid=437170370"
}
else if Command = issue ; IT para criação de Issues
{
    gui_destroy()
    run "https://share.linx.com.br/display/public/POSTOSSUPORTE/AutoSystem+-+Fluxos+e+Processos+N2"
}
else if Command = atrib ; IT de Atribuições para N2
{
    gui_destroy()
    run "https://share.linx.com.br/display/public/POSTOSSUPORTE/AutoSystem+-+Fluxos+e+Processos+N2"
}
else if Command = configcaixa ; IT para configuração de PDV de Teste - NFC-e em Homologação
{
    gui_destroy()
    run "https://share.linx.com.br/pages/releaseview.action?pageId=178867657"
}
else if Command = ponto ; Abre a página para marcação de ponto :D
{
    gui_destroy()
    run "https://login.lg.com.br/saml/auto/linx"
}
else if Command = performance ; Painéis de Performance e Desenvolvimento do Colaborador 
{
    gui_destroy()
    run "https://sistemas.w3net.com.br/Linx/Modulos/LG.HCM.Dashboard/dist/#/"
}
else if Command = versoes ; OneDrive contendo as versões do AutoSystem (por Jairo Caetano Junior)
{
    gui_destroy()
    run %  "https://grupolinx-my.sharepoint.com/personal/jairo_caetano_linx_com_br/_layouts/15/onedrive.aspx?ct=1714050645649&or=Teams%2DHL&ga=1&id=%2Fpersonal%2Fjairo%5Fcaetano%5Flinx%5Fcom%5Fbr%2FDocuments%2FExecut%C3%A1veis%20Migrada"
}
else if Command = maps ; Google Maps - Destino/Rotas
{
    gui_search_title := "Direções no Google Maps"
    gui_search("https://www.google.com/maps/dir/REPLACEME")
}
else if Command = url ; Abre link da Área de Transferência (inocente - tentará executar o que tiver no Ctrl C)
{
    gui_destroy()
    run Trim(ClipBoard)
}
else if Command = start ; Abre a pasta Inicializar do Usuário
{
    gui_destroy()
    run "shell:startup"
}
else if Command = tias ; Try It And See
{
    gui_destroy()
    SendRaw "[TIAS](https://discourse.tbp.land/uploads/default/original/1X/e741730b2b41b7ecd3672f986951038ca43af531.jpeg)"
}
else if Command = sharex ; Abre o ShareX - Fecha o Lightshot caso exista. 
{
    gui_destroy()
    SplashTextOn ,,25,ShareX,Fechando Lightshot...
    run TASKKILL /F /IM Lightshot.exe
	Sleep 250
	SplashTextOff
    If WinExist("ahk_exe ShareX.exe") {
    SplashTextOn ,,25,ShareX,Fechando ShareX...
    run TASKKILL /F /IM ShareX.exe
	Sleep 150
	SplashTextOff
    }
    SplashTextOn ,,25,ShareX,Abrindo ShareX...
    run "%A_ProgramFiles%\Sharex\ShareX.exe"
	SplashTextOn ,,25,ShareX,ShareX aberto!
	Sleep 150
	SplashTextOff
}
else if Command = wpp ; Abre o Whatsapp Web
{
	gui_destroy()
	run "https://web.whatsapp.com/"
}

;-------------------------------------------------------------------------------
;;; INTERAGIR COM ESTE SCRIPT AHK ;;;
;-------------------------------------------------------------------------------
else if Command = dir ; Abre a pasta deste Script
{
    gui_destroy()
    run, %A_ScriptDir%
}
else if Command = user ; Edit GUI user commands
{
    gui_destroy()
    run, %st% "%A_ScriptDir%\GUI\UserCommands.ahk", , Max
}

;-------------------------------------------------------------------------------
;;; ENVIAR TECLAS/TEXTOS ;;;
;-------------------------------------------------------------------------------
else if Command = vv ; Macro de Visita Virtual ao Cliente
{
    gui_destroy()
    SetKeyDelay 1, 1 ; 1ms entre as teclas, 1ms entre down/up -> Somente funcional se utilizarmos SendEvent
    VVAC := "
    (
Visita Virtual ao Cliente.

Procedimentos Realizados:
    - {left 2}{ShiftDown}{Home}{ShiftUp}^u^b{Down} 
    )" ; Voltar a linha de cima, selecionar e Negrito + Itálico
    If WinActive("ahk_class Chrome_WidgetWin_1") ; Verifica se o Chrome está em foco
    Send %VVAC%
	Sleep 500
    ToolTip "Modelo Padrão de Documentação colado no Chrome :)", 75, 675
	Sleep 1500
	ToolTip
}



;-------------------------------------------------------------------------------
;;; ABRIR PASTAS ;;;
;-------------------------------------------------------------------------------
else if Command = ss ; Pasta de Screenshots do ShareX
{
    gui_destroy()
    run "C:\ShareX Portable\ShareX\Screenshots\%A_Year%-%A_Mon%"
}
else if Command = postgres ; Pasta de Instalação do PostgreSQL
{
    gui_destroy()
    run "%A_ProgramFiles%\PostgreSQL"
}
else if Command = rec ; Lixeira
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}
else if Command = wall ; Visualizar Imagem do Wallpaper
{
    gui_destroy()
    Run powershell.exe -NonInteractive -NoLogo -WindowStyle Hidden -ExecutionPolicy Bypass -File "Miscellaneous/Find_current_wallpaper.ps1"

}
;-------------------------------------------------------------------------------
;;; OPERAÇÕES DE BANCO DE DADOS ;;;
;-------------------------------------------------------------------------------

else if Command = asbd ; Abre o banco de dados com as informações padrões
{
	gui_destroy()
    run cmd /K cd "\autosystem\log\psql 14" && psql -h localhost -p 5432 autosystem postgres
	Send, postgres
	return
}

;-------------------------------------------------------------------------------
;;; LINX FAST ;;;
;-------------------------------------------------------------------------------

else if Command = nada ; Ping Google
{
	
}

;-------------------------------------------------------------------------------
;;; OUTROS ;;;
;-------------------------------------------------------------------------------
else if Command = ping ; Ping Google
{
    gui_destroy()
    run cmd /K "ping www.google.com -4"
}
else if Command = feedback ; Conversar com o responsável por esta ferramenta :)
{
    gui_destroy()
    run "msteams:/l/chat/0/0?users=hamilton.santos@linx.com.br"
    WinWaitActive Chat | Hamilton Sergio Quintino Dos Santos Junior,,10,,
    if ErrorLevel
{
    MsgBox, Não foi possível abrir a conversa - Procure manualmente por hamilton.santos@linx.com.br
    return
}
    else
    Sleep 500
    SendRaw Opa! Tenho um feedback sobre o AHK Launcher, tá disponível?
}
else if Command = ? ; Tooltip com a lista de comandos
{
    GuiControl,, Command, ; Clear the input box
    Gosub, gui_commandlibrary
}

else if Command = cami ; contatar o coordenador
{
    gui_destroy()
    run "msteams:/l/chat/0/0?users=camila.goncalves@linx.com.br"
    if ErrorLevel
{
    MsgBox, Não foi possível abrir a conversa - Procure manualmente por camila.goncalves@linx.com.br
    return
}
    else
    Sleep 500
}

else if Command = sombra ; contatar a analista responsável
{
    gui_destroy()
    run "msteams:/l/chat/0/0?users=jonathan.sombrio@linx.com.br"
    WinWaitActive Chat | Jonathan Sombrio,,10,,
    if ErrorLevel
{
    MsgBox, Não foi possível abrir a conversa - Procure manualmente por jonathan.sombrio@linx.com.br
    return
}
    else
    Sleep 500
}

else if Command = qqq ; fecha o programa
{
	ExitApp
}

else if Command = casotd ; Abre o txt para um novo caso
{
	gui_destroy()
	FileRead, OutputVar, ClipBoard, "C:\AHK Launcher Master\Atendimento\Modelo de Atendimento.txt"
	FileAppend, ClipBoard, C:\Suporte Linx\Atendidos\Atendimento.txt
	Sleep 500
	Run C:\Suporte Linx\Atendidos\Atendimentos.txt
	Sleep 500
}

;-------------------------------------------------------------------------------
;;; DEBUG COMMANDS ;;;
;-------------------------------------------------------------------------------
else if Command = notepad ; Verificar caminho do NotePad++.exe
{
    gui_destroy()
    MsgBox,  32, Caminho Atual do NotePad: , %st%, 2
}
else if Command = debug ; Verificar caminho do NotePad++.exe
{
    debugmsg(search_final_url)
}
return