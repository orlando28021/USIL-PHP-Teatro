<?php

require_once ('../AjaxCRUD/preheader.php');

class VotosControl {
    public function MantenimientoVotos(){
        

        include ('../AjaxCRUD/ajaxCRUD.class.php');
        
        
        $tblVotos = new ajaxCRUD("VOTOS", "votos", "idVoto");
        
        $tblVotos->omitPrimaryKey();
        
        $tblVotos->displayAs("voto", "Votos");
        $tblVotos->displayAs("puntaje", "Puntaje");
        $tblVotos->displayAs("idUsuario", "Id Usuario");

        
        $tblVotos->addAjaxFilterBox("voto");
        
        
        $tblVotos->showTable();
    }
}

?>
