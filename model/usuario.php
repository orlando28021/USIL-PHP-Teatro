<?php

class usuario {
    
    private $_id;
    private $_nombre;
    private $_apellidos;
    private $_correo;
    private $_password;
    
    public function __construct($id,$nombre,$apellidos,$correo,$password) {
        $this->_id = $id;
        $this->_nombre = $nombre;
        $this->_apellidos = $apellidos;
        $this->_correo = $correo;
        $this->_password = $password;
    }
    public function get_id() {
        return $this->_id;
    }

    public function get_nombre() {
        return $this->_nombre;
    }

    public function get_apellidos() {
        return $this->_apellidos;
    }

    public function get_correo() {
        return $this->_correo;
    }

    public function get_password() {
        return $this->_password;
    }


    
}

?>
