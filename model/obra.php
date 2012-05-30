<?php
require_once '/../dm/Persistence.php';
require_once '/../dm/Sql.php';
class Obra {
   private $_id;
   private $_nombre;
   private $_autor;
   private $_director;
   private $_actores;
   private $_sala;
   private $_precio;
   private $_temporada;
   private $_afiche;
   private $_resena;

   function __construct($id="", $nombre="", $autor="", $director="", $actores="", $sala="", $precio="", $temporada="", $afiche="", $resena="") {
       $this->_id = $id;
       $this->_nombre = $nombre;
       $this->_autor = $autor;
       $this->_director = $director;
       $this->_actores = $actores;
       $this->_sala = $sala;
       $this->_precio = $precio;
       $this->_temporada = $temporada;
       $this->_afiche = $afiche;
       $this->_resena = $resena;
   }
   public function get_id() {
       return $this->_id;
   }

   public function set_id($_id) {
       $this->_id = $_id;
   }

   public function get_nombre() {
       return $this->_nombre;
   }

   public function set_nombre($_nombre) {
       $this->_nombre = $_nombre;
   }

   public function get_autor() {
       return $this->_autor;
   }

   public function set_autor($_autor) {
       $this->_autor = $_autor;
   }

   public function get_director() {
       return $this->_director;
   }

   public function set_director($_director) {
       $this->_director = $_director;
   }

   public function get_actores() {
       return $this->_actores;
   }

   public function set_actores($_actores) {
       $this->_actores = $_actores;
   }

   public function get_salas() {
       return $this->_salas;
   }

   public function set_salas($_salas) {
       $this->_salas = $_salas;
   }

   public function get_precio() {
       return $this->_precio;
   }

   public function set_precio($_precio) {
       $this->_precio = $_precio;
   }

   public function get_temporada() {
       return $this->_temporada;
   }

   public function set_temporada($_temporada) {
       $this->_temporada = $_temporada;
   }

   public function get_afiche() {
       return $this->_afiche;
   }

   public function set_afiche($_afiche) {
       $this->_afiche = $_afiche;
   }

   public function get_resena() {
       return $this->_resena;
   }

   public function set_resena($_resena) {
       $this->_resena = $_resena;
   }
   public function  insert() {
        $sql=new Sql();
        //añade la tabla a insertar y la accion del sql
        $sql->addTable('obras');
        $sql->setOpcion('insert');
        //añadir los campos a insertar
        $sql->addInto('nombre');
        $sql->addInto('autor');
        $sql->addInto('director');
        $sql->addInto('actores');
        $sql->addInto('sala');
        $sql->addInto('precio');
        $sql->addInto('temporada');
        $sql->addInto('afiche');
        $sql->addInto('resena');

        //añade los valores a insertar
        $sql->addValues($this->_nombre);
        $sql->addValues($this->_autor);
        $sql->addValues($this->_director);
        $sql->addValues($this->_actores);
        $sql->addValues($this->_sala);
        $sql->addValues($this->_precio);
        $sql->addValues($this->_temporada);
        $sql->addValues($this->_afiche);
        $sql->addValues($this->_resena);
        //inserta
        Persistence::insertar($sql);
    }
    private function _getData() {
        $sql = new Sql();
        $sql->addTable("obras");
        $sql->setOpcion("listar");

        $lista = Persistence::consultar($sql);
        return $lista;
    }

    public function getAll() {
        $lista = $this->_getData();
        $obras = array();
        foreach ($lista as $obra) {
            $id= $obra['idObra'];
            $nombre= $obra['nombre'];
            $autor= $obra['autor'];
            $director= $obra['director'];
            $actores= $obra['actores'];
            $sala= $obra['sala'];
            $precio= $obra['precio'];
            $temporada= $obra['temporada'];
            $afiche= $obra['afiche'];
            $resena= $obra['resena'];
            $obras[] = new Obra($id, $nombre, $autor, $director, $actores, $sala, $precio, $temporada, $afiche, $resena);
        }
        return $obras;
    }


}

?>
