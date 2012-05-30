<?php
require_once '../Model/Reserva.php';
class ReservaControl {
    public function listarReservas()
    {
        $reserva = new Reserva();
        $lista = $reserva->getAll();
        return $lista;
    }

    private function getAll(){
        $reserva = new Reserva();
        $lista=$reserva->getAll();
        return $lista;
    }

    public function save($idReserva, $dia, $horaInicio, $horaFin, $estado,$cliente){
        $reserva = new Reserva($idReserva, $dia, $horaInicio, $horaFin, $estado,$cliente);
        $reserva->save();
    }

    public function buscarReservaxId($id){
        $reservas = $this->listarReservas();
        foreach($reservas as $reserva){
            if($reserva->getIdReserva()==$id)
            {
                return $reserva;
            }
        }
     }
}
?>