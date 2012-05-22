<?php

class obra {
   private $_id;
   private $_nombre;
   private $_autor;
   private $_director;
   private $_actores;
   private $_salas;
   private $_precio;
   private $_temporada;
   private $_afiche;
   private $_reseña;
   
   function __construct($_id, $_nombre, $_autor, $_director, $_actores, $_salas, $_precio, $_temporada, $_afiche, $_reseña) {
       $this->_id = $_id;
       $this->_nombre = $_nombre;
       $this->_autor = $_autor;
       $this->_director = $_director;
       $this->_actores = $_actores;
       $this->_salas = $_salas;
       $this->_precio = $_precio;
       $this->_temporada = $_temporada;
       $this->_afiche = $_afiche;
       $this->_reseña = $_reseña;
   }
   
   public function get_id() {
       return $this->_id;
   }

   public function get_nombre() {
       return $this->_nombre;
   }

   public function get_autor() {
       return $this->_autor;
   }

   public function get_director() {
       return $this->_director;
   }

   public function get_actores() {
       return $this->_actores;
   }

   public function get_salas() {
       return $this->_salas;
   }

   public function get_precio() {
       return $this->_precio;
   }

   public function get_temporada() {
       return $this->_temporada;
   }

   public function get_afiche() {
       return $this->_afiche;
   }

   public function get_reseña() {
       return $this->_reseña;
   }



}

?>
