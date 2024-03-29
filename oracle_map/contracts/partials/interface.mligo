type add_param = 
{
   sensor_id : nat;
   data      : nat; 
}

type get_param =
{
    sensor_id : nat;
    data_id   : nat;
}

type withdraw_param =
{
    tez_amt : tez;
}

type sensor_id 	= nat
type data_id   	= nat
type sensor_key = (sensor_id * data_id)

(** parameter type *)
type parameter =
    | Add_data of add_param
    | Add_sensor of sensor_id
    | Remove_sensor of sensor_id
    | Update_admin of address
    | Withdraw of withdraw_param

(** storage type *)
type sensor_ledger = (sensor_key, nat) map

type storage = 
{ 
    sensor_ledger : sensor_ledger;
    n_data_ids    : (sensor_id, data_id) map;
    admin         : address 
}

type return = (operation list) * storage
