using Godot;

public partial class Level1 : Control
{
	private DialogBar dialog_bar;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GD.Print("sdsdsadsadsdasdasdasdsadasd");
		// dialog_bar = GetNode<DialogBar>("DialogBar");
		// dialog_bar.ShowMessages("jose", "muerte1");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
