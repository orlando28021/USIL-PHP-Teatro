<?php

class comentario {
    private $_id;
    private $_publicado;
    private $_comentario;
    private $_fechaRegistro;
    private $_idObra;
    private $_idUsuario;
    
    public function __construct($id,$publicado,$comentario,$fecha,$idObra,$idUsuario) {
        $this->_id = $id;
        $this->_publicado = $publicado;
        $this->_comentario = $comentario;
        $this->_fechaRegistro = $fecha;
        $this->_idObra = $idObra;
        $this->_idUsuario = $idUsuario;
    }
    
    public function get_id() {
        return $this->_id;
    }

    public function get_publicado() {
        return $this->_publicado;
    }

    public function get_comentario() {
        return $this->_comentario;
    }

    public function get_fechaRegistro() {
        return $this->_fechaRegistro;
    }

    public function get_idObra() {
        return $this->_idObra;
    }

    public function get_idUsuario() {
        return $this->_idUsuario;
    }


}

?>
