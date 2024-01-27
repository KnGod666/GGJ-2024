using Godot;
public partial class DialogBox : Control
{
	private readonly string ACTION = "accion";
	private DialogBar dialog_box;


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		dialog_box = GetNode<DialogBar>("DialogBar");
		dialog_box.ShowMessages("muerte4");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{

	}

    public override void _Input(InputEvent @event)
    {
        base._Input(@event);
		if(@event.IsActionPressed(ACTION)){
			if(dialog_box.GetHasNext())
			{
				if(!dialog_box.NextMessage())
				{
					dialog_box.Hide();
				}

			}
		}
    }
}
