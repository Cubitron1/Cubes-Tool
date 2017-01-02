private ["_veh","_dist","_vehtospawn","_dir","_pos","_player"];

_vehtospawn = _this select 0; 
_dist = 7;
_player = player;
_dir = getDir vehicle _player;
_pos = getPosATL vehicle _player;
_pos = [(_pos select 0)+_dist*sin(_dir),(_pos select 1)+_dist*cos(_dir),0];
_worldspace = [_dir,_pos];

_veh = createVehicle [_vehtospawn, _pos, [], 0, "CAN_COLLIDE"];
//_veh setVariable ["MalSar",1,true];
_veh addeventhandler ["HandleDamage",{ _this call fnc_veh_handleDam  } ];
dayz_serverObjectMonitor  set [count dayz_serverObjectMonitor ,_veh];
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
	
cutText ["Spawned a vehicle.", "PLAIN DOWN"];
systemChat "<Admin Menu> Spawned Temporary vehicle";

