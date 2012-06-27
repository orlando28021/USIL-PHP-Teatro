<?php

require_once ('../AjaxCRUD/preheader.php');

class ObraControl {
    public function MantenimientoObra(){
        

        include ('../AjaxCRUD/ajaxCRUD.class.php');
        
        
        $tblObra = new ajaxCRUD("OBRA", "obras", "idObra");
        
        $tblObra->omitPrimaryKey();
        
        $tblObra->displayAs("nombre", "Nombre");
        $tblObra->displayAs("autor", "Autor");
        $tblObra->displayAs("director", "Director");
        $tblObra->displayAs("actores", "Actores");
        $tblObra->displayAs("sala", "Sala");
        $tblObra->displayAs("temporada", "Temporada");
        $tblObra->displayAs("afiche", "Afiche");
        $tblObra->displayAs("reseña", "Reseña");
        
        $tblObra->addAjaxFilterBox("nombre");
        
        
        $tblObra->showTable();
    }
}

?>
