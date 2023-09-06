# Satellite_gml

Observer Pattern in GameMaker

# Function index

## Main functions
- satellite - Returns a SatelliteClass struct
- satellite_broadcast - Broadcast a message and a data to all listeners of the given message.
  
## SatelliteClass 
- add - Add a new listener for this satellite
- remove - Remove a listener for this satellite
- remove_all - Remove all listener from this satellite.
- pause - The listeners from this satellite dont work, even added later 
- resume - The listeners from this satellite will work again.
- set_persistent - Case persistent, satellite_room functions will not afect this Satellite
- clean_up - Remove all listeners and prepare this satellite to be removed from memory. When creating a SatelliteClass, use it on the Instance Clean Up Event.  

## Room Based
Good for dealing with persistent rooms 
- satellite_room_resume - Resume all Satellites listeners in the current room
- satellite_room_pause - Pause all Satellite listeners in the current room
- satellite_room_clean_up - Destroy all Satellite listeners in the current room

- satellite_reset - Reset all satellites and listeners (Reset all system)

## Satellite Config
SATELLITE_STACK_TRACE - Boolean - Will show in console who sent the message an who received ( You can also comment the stack trace ) <br>
SATELLITE_RETURN_DATA_TO_AUTO_DESTROY - Any - Case the listener callback returns this value, it will disable this listener

# What Changed?
- Now if you forget to clean up the Satellite on Instance Clean Up Event, it will no broke your game. When the garbage collector do its work, the system will try to remove the data.
- Pause / Resume the behavior an entire Satellite. On later versions, you have to delete all listeners them add them again.
- Been able to Pause / Resume / Destroy all Satellites created in the current room.
- Stack Trace who sent the message and who received this. Making it more easy to track errors
- The system is more powerful and open (at least for me to maintain this), more simple to read, but a little more RAM consuming because I'm store some weak_refs bacause I dont want to break your game because of it.

# Future Changes?
- Probably a V4 without needind to SatelliteClass.clean_up on Clean Up Event.
