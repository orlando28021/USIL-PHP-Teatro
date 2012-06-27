<?php

require_once ('../AjaxCRUD/preheader.php');

class ComentarioControl {
    public function MantenimientoComentario(){
        

        include ('../AjaxCRUD/ajaxCRUD.class.php');
        
        
        $tblComentario = new ajaxCRUD("COMENTARIO", "comentarios", "idComentario");
        
        $tblComentario->omitPrimaryKey();
        
        $tblComentario->displayAs("publicado", "Publicado");
        $tblComentario->displayAs("comentario", "Comentario");
        $tblComentario->displayAs("fechaRegistro", "Fecha de Registro");
        $tblComentario->displayAs("idObra", "Id Obra");
        $tblComentario->displayAs("idUsuario", "Id Usuario");

        
       $values = array("Cash", "Credit Card", "Paypal");
       $tblComentario->defineAllowableValues("idObra", $values);
        
        $tblComentario->addAjaxFilterBox("comentario");
        
        
        $tblComentario->showTable();
    }
}

?>
