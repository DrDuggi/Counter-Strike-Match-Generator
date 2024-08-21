extends Control

var BotDifficulty = 3   # Done
var BotTeam = 0   # Done
var BotTeamFinish = "CT" # Done
var StartMoney = 800 # Done
var MaxMoney = 16000 # Done
var MaxRound = 30 # Done
var FreezeTime = 10 # Done
var FreeArmor = 0 # Done
var Overtime = true # idk
var BotQuota = 5 # False
var RoundTime = 2 # Done
var halftime = true # idk
var GrenadeLimit = 5 # Done
var BotMimik = false # False
var Enemy = false # False
var PlayerCount = 1
var BotNumber
# Not game specific
var musictrack = false # Music for the Program


# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().title = "Counter-Strike 2 | Bot Match Generator"
	$AudioStreamPlayer2D.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if BotTeam == 1:
		BotTeamFinish = "T"
	else:
		BotTeamFinish = "CT"
	BotNumber = BotQuota + PlayerCount


func _on_close_pressed():
	$AudioStreamPlayer2D4.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()


func _on_sound_pressed():
	$AudioStreamPlayer2D.stop()


func _on_team_item_selected(index: int) -> void:
	if index == 1:
		BotTeam = 1
	else:
		BotTeam = 0
	$AudioStreamPlayer2D2.play()

func _on_difficulty_item_selected(index: int) -> void:
	match index:
		0:
			BotDifficulty = 0
		1:
			BotDifficulty = 1
		2:
			BotDifficulty = 2
		3:
			BotDifficulty = 3
		4:
			BotDifficulty = 4
		5:
			BotDifficulty = 5
	$AudioStreamPlayer2D2.play()

func _on_start_money_item_selected(index: int) -> void:
	match index:
		0:
			StartMoney = 0
		1:
			StartMoney = 200
		2:
			StartMoney = 400
		3:
			StartMoney = 600
		4:
			StartMoney = 800
		5:
			StartMoney = 1000
		6:
			StartMoney = 1500
		7:
			StartMoney = 2500
		8:
			StartMoney = 5000
		9:
			StartMoney = 6500
		10:
			StartMoney = 12000
	$AudioStreamPlayer2D2.play()

func _on_max_money_item_selected(index: int) -> void:
	match index:
		0:
			MaxMoney = 1
		1:
			MaxMoney = 400
		2:
			MaxMoney = 800
		3:
			MaxMoney = 1600
		4:
			MaxMoney = 3200
		5:
			MaxMoney = 6400
		6:
			MaxMoney = 12800
		7:
			MaxMoney = 16000
		8:
			MaxMoney = 25600
		9:
			MaxMoney = 51200
	$AudioStreamPlayer2D2.play()

func _on_freeze_timer_item_selected(index: int) -> void:
	match index:
		0:
			FreezeTime = 0
		1:
			FreezeTime = 5
		2:
			FreezeTime = 10
		3:
			FreezeTime = 15
		4:
			FreezeTime = 20
		5:
			FreezeTime = 25
		6:
			FreezeTime = 30
	$AudioStreamPlayer2D2.play()

func _on_max_rounds_item_selected(index: int) -> void:
	match index:
		0:
			MaxRound = 8
		1:
			MaxRound = 16
		2:
			MaxRound = 30
		3:
			MaxRound = 60
	$AudioStreamPlayer2D2.play()

func _on_grenade_limit_item_selected(index: int) -> void:
	match index:
		0:
			GrenadeLimit = 0
		1:
			GrenadeLimit = 1
		2:
			GrenadeLimit = 2
		3:
			GrenadeLimit = 3
		4:
			GrenadeLimit = 4
		5:
			GrenadeLimit = 5
		6:
			GrenadeLimit = 6
		7:
			GrenadeLimit = 8
	$AudioStreamPlayer2D2.play()

func _on_round_time_item_selected(index: int) -> void:
	match index:
		0:
			RoundTime = 0.5
		1:
			RoundTime = 1
		2:
			RoundTime = 2
		3:
			RoundTime = 3
		4:
			RoundTime = 5
	$AudioStreamPlayer2D2.play()

func _on_overtime_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		Overtime = true
	else:
		Overtime = false
	$AudioStreamPlayer2D2.play()

func _on_halftime_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		halftime = true
	else:
		halftime = false
	$AudioStreamPlayer2D2.play()

func _on_free_armor_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		FreeArmor = 2
	else:
		FreeArmor = 0
	$AudioStreamPlayer2D2.play()

func _on_bot_count_item_selected(index: int) -> void:
	match index:
		0:
			BotQuota = 1
		1:
			BotQuota = 2
		2:
			BotQuota = 3
		3:
			BotQuota = 4
		4:
			BotQuota = 5
		5:
			BotQuota = 6
		6:
			BotQuota = 7
		7:
			BotQuota = 8
		8:
			BotQuota = 9
		9:
			BotQuota = 10
	$AudioStreamPlayer2D2.play()

func _on_player_count_item_selected(index: int) -> void:
	match index:
		0:
			PlayerCount = 1
		1:
			PlayerCount = 2
		2:
			PlayerCount = 3
		3:
			PlayerCount = 4
		4:
			PlayerCount = 5
	$AudioStreamPlayer2D2.play()




func Aftermath():
	pass

func _on_export_pressed() -> void:
	$TextEdit.text = "Exporting..."
	$AnimationPlayer.play("RESET")
	$AudioStreamPlayer2D3.play()
	$TextEdit.text = "bot_kick; mp_limitteams %d" % BotNumber + "; mp_autokick 0; mp_autoteambalance 0; bot_join_team " + str(BotTeamFinish) + "; bot_quota_mode fill; bot_quota %d" % BotNumber + "; mp_warmup_end; mp_freezetime %d" % FreezeTime + "; mp_free_armor %d" % FreeArmor + "; mp_roundtime %d" % RoundTime + "; mp_roundtime_defuse %d" % RoundTime + "; mp_startmoney %d" % StartMoney + "; mp_maxmoney %d" % MaxMoney + "; mp_maxrounds %d" % MaxRound +"; mp_halftime " + str(halftime) + "; mp_overtime_enable " + str(Overtime) + "; ammo_grenade_limit_total %d" % GrenadeLimit + "; bot_difficulty %d" % BotDifficulty + "; mp_restartgame 1"
	DisplayServer.clipboard_set($TextEdit.text)
	$AnimationPlayer.play("Copied")

# Thanks for checking out my code!
