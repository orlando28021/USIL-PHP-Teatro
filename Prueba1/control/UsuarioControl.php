<?php

require_once ('../AjaxCRUD/preheader.php');

class UsuarioControl {
    
    public function MantenimientoUsuario(){
        

        include ('../AjaxCRUD/ajaxCRUD.class.php');
        
        $tblUsuario = new ajaxCRUD("USUARIO", "usuarios", "idUsuario");
        $tblUsuario->omitPrimaryKey();
        
        $tblUsuario->displayAs("nombre", "Nombre");
        $tblUsuario->displayAs("apellido", "Apellido");
        $tblUsuario->displayAs("correo", "Correo");
        $tblUsuario->displayAs("password", "Password");
        $tblUsuario->displayAs("twitter_cuenta", "Cuenta de Twitter");
        $tblUsuario->displayAs("twitter_token", "Token de Twitter");
        
        $tblUsuario->addAjaxFilterBox("nombre");
        
        $tblUsuario->showTable();
    }
    
}

?>
