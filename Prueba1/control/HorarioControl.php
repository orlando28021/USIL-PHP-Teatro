<?php

require_once ('../AjaxCRUD/preheader.php');

class HorarioControl {
    public function MantenimientoHorario(){
        

        include ('../AjaxCRUD/ajaxCRUD.class.php');
        
        
        $tblHorario = new ajaxCRUD("HORARIO", "horarios", "idHorario");
        
        $tblHorario->omitPrimaryKey();
        
        $tblHorario->displayAs("fecha", "Fecha");
        $tblHorario->displayAs("hora", "Hora");

        $tblHorario->modifyFieldWithClass("fecha", "datepicker");
        $tblHorario->modifyFieldWithClass("hora", "timepicker");
        

        
        $tblHorario->addAjaxFilterBox("fecha");

        $tblHorario->showTable();
                
    }
    

}

?>
