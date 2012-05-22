<?php

class horario {
   private $_id;
   private $_fecha;
   private $_hora;
   
   function __construct($_id, $_fecha, $_hora) {
       $this->_id = $_id;
       $this->_fecha = $_fecha;
       $this->_hora = $_hora;
   }
   
   public function get_id() {
       return $this->_id;
   }

   public function get_fecha() {
       return $this->_fecha;
   }

   public function get_hora() {
       return $this->_hora;
   }



           
}

?>
