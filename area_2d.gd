extends Area2D

var start_x  
var start_y
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_x = self.position.x
	start_y = self.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.position.x > start_x - 1200:
		self.position.x += -2
	else: 
		self.position.x = start_x

