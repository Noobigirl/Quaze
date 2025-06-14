extends Node

signal slot_pressed # signal is emitted when a slot of the tool bar is pressed

@export var max_size: int = 5

var gates: Array = [] # 2D array holding the properties of the gate to instance [logic, texture]
var current_slot: int # keeping track of the slot that was clicked
